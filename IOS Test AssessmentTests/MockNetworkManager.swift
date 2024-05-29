//
//  MockNetworkManager.swift
//  IOS Test AssessmentTests
//
//  Created by Raja Pichai on 29/05/24.
//

@testable import IOS_Test_Assessment

class MockNetworkManager: NetworkManager {
    var fetchPostsCompletion: (([Post]?, Error?) -> Void)?

    // Make the initializer accessible to the test target
    override init() {
        super.init()
    }

    override func fetchPosts(page: Int, limit: Int, completion: @escaping ([Post]?, Error?) -> Void) {
        fetchPostsCompletion = completion
    }
}

enum MockData {
    static let posts: [Post] = [
        Post(userId: 1, id: 1, title: "Test Title 1", body: "Test Body 1"),
        Post(userId: 2, id: 2, title: "Test Title 2", body: "Test Body 2")
        // Add more mock posts as needed
    ]

    static let emptyPosts: [Post] = []
}
