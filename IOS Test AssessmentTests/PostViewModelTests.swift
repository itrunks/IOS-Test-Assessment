//
//  PostViewModelTests.swift
//  IOS Test AssessmentTests
//
//  Created by Raja Pichai on 29/05/24.
//

import XCTest

@testable import IOS_Test_Assessment

class PostViewModelTests: XCTestCase {
    var viewModel: PostViewModel!
    var networkManager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        viewModel = PostViewModel(networkManager: networkManager)
    }

    override func tearDown() {
        viewModel = nil
        networkManager = nil
        super.tearDown()
    }

    // PostViewModelTests.swift
    func testFetchPosts() {
        let expectation = XCTestExpectation(description: "Fetch posts")

        // First fetch some posts
        viewModel.fetchPosts()
        networkManager.fetchPostsCompletion?(MockData.posts, nil)

        // Wait for the first fetch to complete
        DispatchQueue.main.async {
            XCTAssertEqual(
                self.viewModel.numberOfPosts(), MockData.posts.count,
                "Number of posts should match after first fetch")

            // Now fetch no new posts to trigger allDataLoaded
            self.viewModel.fetchPosts()
            self.networkManager.fetchPostsCompletion?(MockData.emptyPosts, nil)

            DispatchQueue.main.async {
                XCTAssertTrue(
                    self.viewModel.allDataLoaded, "allDataLoaded flag should be true when all data is loaded")
                expectation.fulfill()
            }
        }

        wait(for: [expectation], timeout: 1.0)
    }

    // Add more test cases as needed for other functions in PostViewModel
}
