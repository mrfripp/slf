//
// Created by Fredrik Pettersson on 26/03/2018.
//

import Nimble
@testable import slf
import XCTest

class FileLocationTests: XCTestCase {

    private var logger: Logger!

    private var arrayAppender: ArrayAppender!

    override func setUp() {
        super.setUp()

        arrayAppender = ArrayAppender()
        let provider = TestLoggerFactory(
                logLevel: .trace,
                appenders: [
                    arrayAppender
                ]
        )
        LoggerFactory.use(provider: provider)

        logger = LoggerFactory.getLogger(FileLocationTests.self)
    }

    func testLoggerClassType() {
        expect(self.logger).to(beAKindOf(ArrayLogger.self))
    }

    func testTraceIsLogging() {
        logger.trace("Trace logging.")

        expect(self.arrayAppender.logs).to(haveCount(1))
    }

    func testTraceLogLevel() {
        logger.trace("Trace logging.")

        let event = self.arrayAppender.logs.first!

        expect(event.level) == LogLevel.trace
    }

    func testTraceFunctionName() {
        logger.trace("Trace logging.")

        let event = self.arrayAppender.logs.first!

        expect(event.functionName) == "testTraceFunctionName()"
    }

    func testTraceFileName() {
        logger.trace("Trace logging.")

        let event = self.arrayAppender.logs.first!

        expect(event.fileName).to(endWith("FileLocationTests.swift"))
    }

    func testTraceLineNumber() {
        logger.trace("Trace logging.")

        let event = self.arrayAppender.logs.first!

        expect(event.lineNum) == 65
    }

    func testTraceLogMessage() {
        logger.trace("Trace logging.")

        let event = self.arrayAppender.logs.first!

        expect(event.message) == "Trace logging."
    }
}
