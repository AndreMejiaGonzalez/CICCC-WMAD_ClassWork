import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(N_Queens_Problem_SwiftTests.allTests),
    ]
}
#endif
