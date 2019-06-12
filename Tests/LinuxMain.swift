import XCTest

import SimpleLoggerTests
import slfTests

var tests = [XCTestCaseEntry]()
tests += SimpleLoggerTests.__allTests()
tests += slfTests.__allTests()

XCTMain(tests)
