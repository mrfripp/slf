//
// Created by Fredrik Pettersson on 09/04/2018.
//

import slf

public protocol Appender: LoggerListener {

    func getName() -> String

    func doAppend(event: LoggingEvent)
}

public protocol AppenderAttachable {

    func addAppender(_ appender: Appender)

    func detachAppender(_ appender: Appender)
}

public protocol LoggerListener: class {

}

public class SimpleLoggerFactory: SLFServiceProvider {

    private var logLevel: LogLevel
    private var appenders: [Appender]
    private var loggers: [String: Logger] = [:]

    public init(logLevel: LogLevel, appenders: [Appender]) {
        self.logLevel = logLevel
        self.appenders = appenders
    }

    public func getLogger(name: String) -> Logger {
        if let logger = loggers[name] {
            return logger
        }

        let logger = SimpleLogger(name: name)
        logger.logLevel = logLevel
        appenders.forEach { appender in
            logger.addAppender(appender)
        }

        loggers[name] = logger

        return logger
    }
}
