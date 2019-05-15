//
// Created by Fredrik Pettersson on 26/03/2018.
//

import Nimble
@testable import slf
import XCTest

class ArrayLoggerTests: XCTestCase {

    var logger: Logger!

    private var arrayAppender: ArrayAppender!

    override func setUp() {
        super.setUp()

        let provider = TestLoggerFactory(
                logLevel: .trace,
                appenders: [
                    ArrayAppender()
                ]
        )

        LoggerFactory.use(provider: provider)

        logger = LoggerFactory.getLogger(FileLocationTests.self)
    }

    func testLogTrace() {
        logger.log(.trace, "Trace logging.")
    }
}

#if os(Linux)
extension NoOpLoggerTests {
    static var allTests: [(String, (NoOpLoggerTests) -> () throws -> Void)] {
        return []
    }
}
#endif
