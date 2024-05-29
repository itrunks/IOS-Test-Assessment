//
//  NetworkManager.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import Foundation

/// A manager for handling network requests related to posts.
class NetworkManager {
    /// Shared instance of the `NetworkManager`.
    static let shared = NetworkManager()

    internal init() {}

    /// Fetches posts from the API.
    ///
    /// - Parameters:
    ///   - page: The page number of posts to fetch.
    ///   - limit: The maximum number of posts per page.
    ///   - completion: A closure to be called when the fetch completes, containing an optional array of `Post` objects and an optional error.
    func fetchPosts(page: Int, limit: Int, completion: @escaping ([Post]?, Error?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts?_page=\(page)&_limit=\(limit)"
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.invalidURL)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }

            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
