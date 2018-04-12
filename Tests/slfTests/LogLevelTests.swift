//
// Created by Fredrik Pettersson on 11/04/2018.
//

import Nimble
@testable import slf
import XCTest

class LogLevelTests: XCTestCase {

    private var logger: Logger!

    private var arrayAppender: ArrayAppender!

    override func setUp() {
        super.setUp()

        arrayAppender = ArrayAppender()
        let provider = TestLoggerFactory(
                logLevel: LogLevel.warn,
                appenders: [
                    arrayAppender
                ]
        )
        LoggerFactory.use(provider: provider)

        logger = LoggerFactory.getLogger(LogLevelTests.self)
    }

    func testTrace() {
        logger.trace("Trace logging.")

        expect(self.arrayAppender.logs).to(haveCount(0))
    }

    func testDebug() {
        logger.debug("Debug logging.")

        expect(self.arrayAppender.logs).to(haveCount(0))
    }

    func testInfo() {
        logger.info("Info logging.")

        expect(self.arrayAppender.logs).to(haveCount(0))
    }

    func testWarn() {
        logger.warn("Warn logging.")

        expect(self.arrayAppender.logs).to(haveCount(1))
    }

    func testError() {
        logger.error("Error logging.")

        expect(self.arrayAppender.logs).to(haveCount(1))
    }
}
