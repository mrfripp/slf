//
// Created by Fredrik Pettersson on 06/04/2018.
//

import Foundation

class NoOpServiceProvider: SLFServiceProvider {

    func getLogger(name: String) -> Logger {
        return NoOpLogger(name: name)
    }
}

private class NoOpLogger: Logger {

    let name: String

    required init(name: String) {
        self.name = name
    }

    func logEvent(_ event: LoggingEvent) {

    }

    internal func isTraceEnabled() -> Bool {
        return false
    }

    internal func isDebugEnabled() -> Bool {
        return false
    }

    internal func isInfoEnabled() -> Bool {
        return false
    }

    internal func isWarnEnabled() -> Bool {
        return false
    }

    internal func isErrorEnabled() -> Bool {
        return false
    }
}
