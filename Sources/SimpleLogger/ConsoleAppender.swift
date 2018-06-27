//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation
import slf

// 2018-03-21 13:38:38.094  INFO 14575 --- [sk-scheduler-10] c.c.e.source.EventReportDownloadService  : Message 1.
// 2018-03-21 13:38:38.100 ERROR 14575 --- [sk-scheduler-10] c.c.e.source.EventReportsSourceService   : Message 2.
// 2018-03-20 12:06:32.139  INFO 64504 --- [           main] o.s.s.c.ThreadPoolTaskScheduler          : Initializing ExecutorService  'taskScheduler'

public class ConsoleAppender: Appender {

    public var formatter: SimpleLoggerFormatter = SpringBootLoggerFormatter(color: true)

    public let name: String

    public required init(name: String) {
        self.name = name
    }

    public func getName() -> String {
        return name
    }

    public func doAppend(event: LoggingEvent) {
        print(formatter.formatEvent(event))
    }
}
