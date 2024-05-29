//
//  NetworkManagerTests.swift
//  IOS Test AssessmentTests
//
//  Created by Raja Pichai on 29/05/24.
//

@testable import IOS_Test_Assessment
import XCTest

class NetworkManagerTests: XCTestCase {
    var networkManager: NetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = NetworkManager.shared
    }

    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }

    func testFetchPosts() {
        let expectation = XCTestExpectation(description: "Fetch posts")
        var fetchedPosts: [Post]?
        var fetchError: Error?

        networkManager.fetchPosts(page: 1, limit: 10) { posts, error in
            fetchedPosts = posts
            fetchError = error
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5.0)

        XCTAssertNil(fetchError, "Error fetching posts: \(fetchError?.localizedDescription ?? "")")
        XCTAssertNotNil(fetchedPosts, "Fetched posts should not be nil")
        XCTAssertEqual(fetchedPosts?.count, 10, "Fetched posts count should be 10")
    }

    // Add more test cases as needed for other functions in NetworkManager
}
