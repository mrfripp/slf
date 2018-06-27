//
// Created by Fredrik Pettersson on 09/04/2018.
//

import slf

class SimpleLogger: Logger {

    let name: String
    public var logLevel: LogLevel = .warn

    private var appenders: [Appender] = []

    internal required init(name: String) {
        self.name = name
    }

    func logEvent(_ event: LoggingEvent) {
        appenders.forEach { appender in
            appender.doAppend(event: event)
        }
    }

    internal func isTraceEnabled() -> Bool {
        return canLog(logLevel: .trace)
    }

    internal func isDebugEnabled() -> Bool {
        return canLog(logLevel: .debug)
    }

    internal func isInfoEnabled() -> Bool {
        return canLog(logLevel: .info)
    }

    internal func isWarnEnabled() -> Bool {
        return canLog(logLevel: .warn)
    }

    internal func isErrorEnabled() -> Bool {
        return canLog(logLevel: .error)
    }

    private func canLog(logLevel: LogLevel) -> Bool {
        switch logLevel {
        case .trace:
            return self.logLevel == .trace
        case .debug:
            return self.logLevel == .trace || self.logLevel == .debug
        case .info:
            return self.logLevel == .trace || self.logLevel == .debug || self.logLevel == .info
        case .warn:
            return self.logLevel == .trace || self.logLevel == .debug || self.logLevel == .info || self.logLevel == .warn
        case .error:
            return self.logLevel != .error
        }
    }

    func addAppender(_ appender: Appender) {
        appenders.append(appender)
    }

    func detachAppender(_ appender: Appender) {
        appenders = appenders.filter {
            $0 !== appender
        }
    }
}
