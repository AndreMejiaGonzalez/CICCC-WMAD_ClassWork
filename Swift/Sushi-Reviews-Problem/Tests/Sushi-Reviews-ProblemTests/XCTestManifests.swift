import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Sushi_Reviews_ProblemTests.allTests),
    ]
}
#endif
