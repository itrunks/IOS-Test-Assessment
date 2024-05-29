//
//  ComputationCacheTests.swift
//  IOS Test AssessmentTests
//
//  Created by Raja Pichai on 29/05/24.
//

@testable import IOS_Test_Assessment
import XCTest

class ComputationCacheTests: XCTestCase {
    var computationCache: ComputationCache!

    override func setUp() {
        super.setUp()
        computationCache = ComputationCache.shared
    }

    override func tearDown() {
        computationCache = nil
        super.tearDown()
    }

    func testSetAndGetComputation() {
        let postId = 1
        let expectedResult = "result"

        computationCache.setComputation(for: postId, result: expectedResult)
        let result = computationCache.getComputation(for: postId)

        XCTAssertEqual(result, expectedResult, "Cached result should match expected result")
    }

    // Add more test cases as needed for other functions in ComputationCache
}
