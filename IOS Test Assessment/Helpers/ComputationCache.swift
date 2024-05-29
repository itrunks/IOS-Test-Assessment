//
//  ComputationCache.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import Foundation

/// A singleton class for caching computation results based on post ID.
class ComputationCache {
    /// Shared instance of the cache.
    static let shared = ComputationCache()
    
    /// NSCache to store computation results with post ID as key.
    private var cache = NSCache<NSNumber, NSString>()
    
    /// Private initializer to prevent direct instantiation.
    private init() {}
    
    /// Retrieves the cached computation result for a given post ID.
    /// - Parameter postId: The ID of the post.
    /// - Returns: The cached computation result, or nil if not found.
    func getComputation(for postId: Int) -> String? {
        return cache.object(forKey: NSNumber(value: postId)) as String?
    }
    
    /// Sets the computation result for a given post ID in the cache.
    /// - Parameters:
    ///   - postId: The ID of the post.
    ///   - result: The computation result to cache.
    func setComputation(for postId: Int, result: String) {
        cache.setObject(result as NSString, forKey: NSNumber(value: postId))
    }
}

