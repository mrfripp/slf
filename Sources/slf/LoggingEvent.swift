//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation

public struct LoggingEvent {
    public let timestamp: Date
    public let loggerName: String
    public let level: LogLevel
    public let message: String
    public let functionName: String
    public let fileName: String
    public let lineNum: Int
    public let threadName: String
    public let queueLabel: String?
    public let processId: String
    public let error: Error?
}
