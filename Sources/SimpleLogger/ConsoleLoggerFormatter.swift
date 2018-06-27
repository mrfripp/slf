//
// Created by Fredrik Pettersson on 21/03/2018.
//

import Foundation
import slf

public protocol SimpleLoggerFormatter {

    func formatEvent(_ event: LoggingEvent) -> String
}
