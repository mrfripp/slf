#if !canImport(ObjectiveC)
import XCTest

extension ArrayLoggerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__ArrayLoggerTests = [
        ("testLogTrace", testLogTrace),
    ]
}

extension FileLocationTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__FileLocationTests = [
        ("testLoggerClassType", testLoggerClassType),
        ("testTraceFileName", testTraceFileName),
        ("testTraceFunctionName", testTraceFunctionName),
        ("testTraceIsLogging", testTraceIsLogging),
        ("testTraceLineNumber", testTraceLineNumber),
        ("testTraceLogLevel", testTraceLogLevel),
        ("testTraceLogMessage", testTraceLogMessage),
    ]
}

extension LogLevelTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__LogLevelTests = [
        ("testDebug", testDebug),
        ("testError", testError),
        ("testInfo", testInfo),
        ("testTrace", testTrace),
        ("testWarn", testWarn),
    ]
}

extension NoOpLoggerTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__NoOpLoggerTests = [
        ("testLogConvenientDebug", testLogConvenientDebug),
        ("testLogConvenientDebugWithError", testLogConvenientDebugWithError),
        ("testLogConvenientError", testLogConvenientError),
        ("testLogConvenientErrorWithError", testLogConvenientErrorWithError),
        ("testLogConvenientInfo", testLogConvenientInfo),
        ("testLogConvenientInfoWithError", testLogConvenientInfoWithError),
        ("testLogConvenientTrace", testLogConvenientTrace),
        ("testLogConvenientTraceWithError", testLogConvenientTraceWithError),
        ("testLogConvenientWarn", testLogConvenientWarn),
        ("testLogConvenientWarnWithError", testLogConvenientWarnWithError),
        ("testLogDebug", testLogDebug),
        ("testLogDebugWithError", testLogDebugWithError),
        ("testLogError", testLogError),
        ("testLogErrorWithError", testLogErrorWithError),
        ("testLogInfo", testLogInfo),
        ("testLogInfoWithError", testLogInfoWithError),
        ("testLogTrace", testLogTrace),
        ("testLogTraceWithError", testLogTraceWithError),
        ("testLogWarn", testLogWarn),
        ("testLogWarnWithError", testLogWarnWithError),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ArrayLoggerTests.__allTests__ArrayLoggerTests),
        testCase(FileLocationTests.__allTests__FileLocationTests),
        testCase(LogLevelTests.__allTests__LogLevelTests),
        testCase(NoOpLoggerTests.__allTests__NoOpLoggerTests),
    ]
}
#endif
