//
// Created by Fredrik Pettersson on 26/03/2018.
//

@testable import slf
import XCTest

class NoOpLoggerTests: XCTestCase {

    let logger: Logger = LoggerFactory.getLogger(NoOpLoggerTests.self)

    func testLogTrace() {
        logger.log(.trace, "Trace logging.")
    }

    func testLogDebug() {
        logger.log(.debug, "Debug logging.")
    }

    func testLogInfo() {
        logger.log(.info, "Info logging.")
    }

    func testLogWarn() {
        logger.log(.warn, "Warn logging.")
    }

    func testLogError() {
        logger.log(.error, "Error logging.")
    }

    // With errors.

    func testLogTraceWithError() {
        logger.log(.trace, "Trace logging.", TestingError.invalidSelection)
    }

    func testLogDebugWithError() {
        logger.log(.debug, "Debug logging.", TestingError.invalidSelection)
    }

    func testLogInfoWithError() {
        logger.log(.info, "Info logging.", TestingError.outOfStock(product: "Balloons", size: .large))
    }

    func testLogWarnWithError() {
        logger.log(.warn, "Warn logging.", TestingError.invalidSelection)
    }

    func testLogErrorWithError() {
        logger.log(.error, "Error logging.", TestingError.insufficientFunds(coinsNeeded: 1))
    }

    // Convenient methods.

    func testLogConvenientTrace() {
        logger.trace("Trace logging.")
    }

    func testLogConvenientDebug() {
        logger.debug("Debug logging.")
    }

    func testLogConvenientInfo() {
        logger.info("Info logging.")
    }

    func testLogConvenientWarn() {
        logger.warn("Warn logging.")
    }

    func testLogConvenientError() {
        logger.error("Error logging.")
    }

    // Convenient methods with error.

    func testLogConvenientTraceWithError() {
        logger.trace("Trace logging.", TestingError.invalidSelection)
    }

    func testLogConvenientDebugWithError() {
        logger.debug("Debug logging.", TestingError.invalidSelection)
    }

    func testLogConvenientInfoWithError() {
        logger.info("Info logging.", TestingError.outOfStock(product: "Balloons", size: .large))
    }

    func testLogConvenientWarnWithError() {
        logger.warn("Warn logging.", TestingError.invalidSelection)
    }

    func testLogConvenientErrorWithError() {
        logger.error("Error logging.", TestingError.insufficientFunds(coinsNeeded: 1))
    }
}

enum TestingError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock(product: String, size: TestingProductSize)
}

enum TestingProductSize {
    case small
    case medium
    case large
}

#if os(Linux)
extension NoOpLoggerTests {
    static var allTests: [(String, (NoOpLoggerTests) -> () throws -> Void)] {
        return [
            ("testLogTrace", testLogTrace),
            ("testLogDebug", testLogDebug),
            ("testLogInfo", testLogInfo),
            ("testLogWarn", testLogWarn),
            ("testLogError", testLogError)
        ]
    }
}
#endif
