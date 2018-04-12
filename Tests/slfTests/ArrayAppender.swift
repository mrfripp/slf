//
// Created by Fredrik Pettersson on 06/04/2018.
//

import slf

class ArrayAppender: Appender {

    public var logs: [LoggingEvent] = []

    func getName() -> String {
        return ""
    }

    func setName(_ name: String) {

    }

    func doAppend(event: LoggingEvent) {
        logs.append(event)
    }
}
