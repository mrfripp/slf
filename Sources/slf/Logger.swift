//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation

public protocol Logger {

    var name: String { get }

    init(name: String)

    func logEvent(_ event: LoggingEvent)

    func isTraceEnabled() -> Bool

    func isDebugEnabled() -> Bool

    func isInfoEnabled() -> Bool

    func isWarnEnabled() -> Bool

    func isErrorEnabled() -> Bool
}

public extension Logger {

    func log(_ level: LogLevel, _ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
             functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        guard isEnabled(logLevel: level) else {
            return
        }

        logEvent(LoggingEvent(
                timestamp: Date(),
                loggerName: self.name,
                level: level,
                message: msg().description,
                functionName: functionName,
                fileName: fileName,
                lineNum: lineNum,
                threadName: threadName(),
                queueLabel: currentQueueLabel(),
                processId: processId(),
                error: error
        ))
    }

    private func isEnabled(logLevel: LogLevel) -> Bool {
        switch logLevel {
        case .trace:
            return isTraceEnabled()
        case .debug:
            return isDebugEnabled()
        case .info:
            return isInfoEnabled()
        case .warn:
            return isWarnEnabled()
        case .error:
            return isErrorEnabled()
        }
    }

    func trace(_ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
               functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        log(.trace, msg, error, functionName: functionName, lineNum: lineNum, fileName: fileName)
    }

    func debug(_ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
               functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        log(.debug, msg, error, functionName: functionName, lineNum: lineNum, fileName: fileName)
    }

    func info(_ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
              functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        log(.info, msg, error, functionName: functionName, lineNum: lineNum, fileName: fileName)
    }

    func warn(_ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
              functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        log(.warn, msg, error, functionName: functionName, lineNum: lineNum, fileName: fileName)
    }

    func error(_ msg: @autoclosure () -> CustomStringConvertible, _ error: Error? = nil,
               functionName: String = #function, lineNum: Int = #line, fileName: String = #file) {
        log(.error, msg, error, functionName: functionName, lineNum: lineNum, fileName: fileName)
    }

    private func threadName() -> String {
#if os(Linux)
        return "not-implemented"
#else
        if Thread.isMainThread {
            return "main"
        } else {
            let threadName = Thread.current.name
            if let threadName = threadName, !threadName.isEmpty {
                return threadName
            } else {
                return String(format: "%p", Thread.current)
            }
        }
#endif
    }

    private func currentQueueLabel() -> String? {
#if os(Linux)
        return "not-implemented"
#else
        guard Thread.isMainThread == false else {
            return nil
        }
        return String(validatingUTF8: __dispatch_queue_get_label(nil))
#endif
    }

    private func processId() -> String {
        return String(ProcessInfo.processInfo.processIdentifier)
    }
}
