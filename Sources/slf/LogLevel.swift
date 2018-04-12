//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation

public enum LogLevel {
    case error
    case warn
    case info
    case debug
    case trace
}

extension LogLevel: CustomStringConvertible {

    public var description: String {
        switch self {
        case .error:
            return "ERROR"
        case .warn:
            return "WARN"
        case .info:
            return "INFO"
        case .debug:
            return "DEBUG"
        case .trace:
            return "TRACE"
        }
    }
}
