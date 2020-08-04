import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(UnionFind_Implementation_SwiftTests.allTests),
    ]
}
#endif
