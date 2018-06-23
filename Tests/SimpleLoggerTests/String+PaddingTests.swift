@testable import SimpleLogger
import XCTest

class StringPaddingTests: XCTestCase {

    func testPaddingLeftWhenShorterThenLength() {
        XCTAssertEqual("test".leftPadding(length: 6), "  test", "Incorrect padding.")
    }

    func testPaddingLeftWhenEqualToLength() {
        XCTAssertEqual("test".leftPadding(length: 4), "test", "Incorrect padding.")
    }

    func testPaddingLeftWhenLongerThenLength() {
        XCTAssertEqual("test".leftPadding(length: 2), "st", "Incorrect padding.")
    }

    func testPaddingRightWhenShorterThenLength() {
        XCTAssertEqual("test".rightPadding(length: 6), "test  ", "Incorrect padding.")
    }

    func testPaddingRightWhenEqualToLength() {
        XCTAssertEqual("test".rightPadding(length: 4), "test", "Incorrect padding.")
    }

    func testPaddingRightWhenLongerThenLength() {
        XCTAssertEqual("test".rightPadding(length: 2), "te", "Incorrect padding.")
    }
}
