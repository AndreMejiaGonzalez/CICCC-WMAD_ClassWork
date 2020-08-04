import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LCA_SwiftTests.allTests),
    ]
}
#endif
