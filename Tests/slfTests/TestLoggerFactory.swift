//
// Created by Fredrik Pettersson on 06/04/2018.
//

@testable import slf

protocol Appender: LoggerListener {

    func getName() -> String

    func setName(_ name: String)

    func doAppend(event: LoggingEvent)
}

protocol AppenderAttachable {

    func addAppender(_ appender: Appender)

    func detachAppender(_ appender: Appender)
}

protocol LoggerListener: class {

}

class TestLoggerFactory: SLFServiceProvider {

    private var logLevel: LogLevel
    private var appenders: [Appender]
    private var loggers: [String: Logger] = [:]

    init(logLevel: LogLevel, appenders: [Appender]) {
        self.logLevel = logLevel
        self.appenders = appenders
    }

    func getLogger(name: String) -> Logger {
        if let logger = loggers[name] {
            return logger
        }

        let logger = ArrayLogger(name: name)
        logger.logLevel = logLevel
        appenders.forEach { appender in
            logger.addAppender(appender)
        }

        loggers[name] = logger

        return logger
    }
}
