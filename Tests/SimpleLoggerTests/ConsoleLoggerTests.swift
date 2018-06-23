//
// Created by Fredrik Pettersson on 11/04/2018.
//

import Nimble
@testable import SimpleLogger
import XCTest

class SimpleLoggerTests: XCTestCase {

    func testCreateLogger() {

        let logger = SimpleLogger(name: "test-logger")

        expect(logger.name) == "test-logger"
    }
}

#if os(Linux)
extension SimpleLoggerTests {
    static var allTests: [(String, SimpleLoggerTests -> () throws -> Void)] {
        return [
            ("testString", testString)
        ]
    }
}
#endif
