//
//  PostViewModel.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import Foundation

/// Manages the fetching and storage of posts from a network service.
class PostViewModel {
  private var posts: [Post] = []
  private var currentPage = 1
  private var isFetching = false
  internal var allDataLoaded = false
  private let networkManager: NetworkManager

  var updateHandler: (() -> Void)?

  /// Initializes a new instance of `PostViewModel`.
  ///
  /// - Parameter networkManager: The network manager to use for fetching posts. Defaults to `NetworkManager.shared`.
  init(networkManager: NetworkManager = NetworkManager.shared) {
    self.networkManager = networkManager
  }

  /// Fetches a batch of posts from the network service.
  ///
  /// This method fetches a batch of posts from the network service, appends them to the internal `posts` array,
  /// and increments the `currentPage` counter. If no new posts are fetched, sets `allDataLoaded` to `true`.
  ///
  /// - Note: This method does nothing if a fetch operation is already in progress (`isFetching` is `true`).
  func fetchPosts() {
    guard !isFetching else { return }
    isFetching = true

    networkManager.fetchPosts(page: currentPage, limit: 10) { [weak self] newPosts, error in
      guard let self = self else { return }

      if let error = error {
        print("Error fetching posts: \(error.localizedDescription)")
        self.isFetching = false
        return
      }

      if let newPosts = newPosts {
        self.posts.append(contentsOf: newPosts)
        self.currentPage += 1
        self.updateHandler?()

        // Update allDataLoaded flag if no new posts were fetched
        if newPosts.isEmpty {
          self.allDataLoaded = true
        }
      }

      self.isFetching = false
    }
  }

  /// Returns the post at the specified index.
  ///
  /// - Parameter index: The index of the post to retrieve.
  /// - Returns: The post at the specified index, or `nil` if the index is out of bounds.
  func post(at index: Int) -> Post? {
    guard index < posts.count else { return nil }
    return posts[index]
  }

  /// Returns the number of posts currently stored in the `posts` array.
  ///
  /// - Returns: The number of posts.
  func numberOfPosts() -> Int {
    return posts.count
  }
}
