//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation
import slf

#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

public class SpringBootLoggerFormatter: SimpleLoggerFormatter {

    private let color: Bool

    private let formatter = DateFormatter()

    init(color: Bool = false) {
        self.color = color
        self.formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    }

    public func formatEvent(_ event: LoggingEvent) -> String {

        let xcodeColorsEnabled = getEnvValue("XcodeColors") == "YES"
        let termType = getEnvValue("TERM") // xterm-256color
        let appCode = getEnvValue("XPC_SERVICE_NAME")?.contains("AppCode") ?? true

//        print("xcodeColorsEnabled=\(xcodeColorsEnabled), termType=\(termType), appCode=\(appCode)")

        let colorEnabled = appCode || termType?.contains("color") ?? false

        if colorEnabled {
            return formatLogColor(event)
        } else {
            return formatLog(event)
        }
    }

    private func getEnvValue(_ key: String) -> String? {
        guard let value = getenv(key) else {
            return nil
        }
        return String(cString: value)
    }

    private func formatLogColor(_ event: LoggingEvent) -> String {
        let timestamp: String = formatter.string(from: event.timestamp)
        var threadDescription: String = ""

        if let queueLabel = event.queueLabel {
            threadDescription = queueLabel.replacingOccurrences(of: "com.apple.root.", with: "") + "-" + event.threadName.leftPadding(length: 6)
        } else {
            threadDescription = event.threadName
        }

        var errorDescription = ""
        if let error = event.error {
            errorDescription = "[\(error)] "
        }

        return
                wrap(timestamp, color: .gray) +
                " " +
                wrap(event.level.description.leftPadding(length: 5), color: color(from: event.level)) +
                " " +
                wrap(event.processId, color: .magenta) +
                wrap(" --- ", color: .gray) +
                wrap("[\(threadDescription.leftPadding(length: 25))] ", color: .gray) +
                wrap(event.loggerName.rightPadding(length: 40), color: .cyan) +
                wrap(": ", color: .gray) +
                        event.message +
                " " + wrap(errorDescription, color: .red) +
                wrap("(\(event.fileName):\(event.lineNum))", color: .gray)
    }

    private func formatLog(_ event: LoggingEvent) -> String {
        let timestamp: String = formatter.string(from: event.timestamp)
        var threadDescription: String = ""

        if let queueLabel = event.queueLabel {
            threadDescription = queueLabel.replacingOccurrences(of: "com.apple.root.", with: "") + "-" + event.threadName.leftPadding(length: 6)
        } else {
            threadDescription = event.threadName
        }

        var errorDescription = ""
        if let error = event.error {
            errorDescription = "[\(error)] "
        }

        return
                "\(timestamp) " +
                "\(event.level.description.leftPadding(length: 5)) " +
                "\(event.processId) --- " +
                "[\(threadDescription.leftPadding(length: 25))] " +
                "\(event.loggerName.rightPadding(length: 40)) " +
                ": " +
                event.message +
                " " +
                errorDescription +
                "(\(event.fileName):\(event.lineNum))"
    }

    private func wrap(_ string: String, color: AnsiColor) -> String {
        if string.isEmpty {
            return string
        }
        return color.rawValue + string + AnsiColor.reset.rawValue
    }

    private func color(from level: LogLevel) -> AnsiColor {
        switch level {
        case .warn:
            return .yellow
        case .error:
            return .red
        default:
            return .green
        }
    }
}

enum AnsiColor: String {
    case black = "\u{001B}[0;30m"
    case red = "\u{001B}[0;31m"
    case green = "\u{001B}[0;32m"
    case yellow = "\u{001B}[0;33m"
    case blue = "\u{001B}[0;34m"
    case magenta = "\u{001B}[0;35m"
    case cyan = "\u{001B}[0;36m"
    case white = "\u{001B}[0;37m"
    case gray = "\u{001B}[38;5;240m"
    case reset = "\u{001B}[0;0m"
}
