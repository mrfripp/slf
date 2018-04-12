import XCTest

import slfTests

var tests = [XCTestCaseEntry]()
tests += slfTests.allTests()
XCTMain(tests)