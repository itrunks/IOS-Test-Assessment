//
//  DetailViewController.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!

    var post: Post?

    // Memoization cache
    private var computationCache = [Int: String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let post = post else { return }
        titleLabel.text = post.title
        bodyLabel.text = post.body
        performHeavyComputation(for: post.id)
    }

    /// Performs a heavy computation for a given post ID and caches the result to avoid re-computation.
    ///
    /// This method checks if the computation result for the given post ID is already cached. If the result
    /// is cached, it uses the cached result. Otherwise, it performs the heavy computation, caches the result,
    /// and logs the time taken for the computation.
    ///
    /// - Parameter postId: The ID of the post for which the heavy computation is performed.
    private func performHeavyComputation(for postId: Int) {
        // Check if the result is already cached
        if let cachedResult = computationCache[postId] {
            // Use the cached result
            print("Computation result (cached): \(cachedResult)")
            return
        }

        // Start timing the computation
        let startTime = CFAbsoluteTimeGetCurrent()

        // Perform some heavy computation
        var result = 0
        for i in 0 ..< 10000 {
            result += i
        }

        // End timing the computation
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time taken for heavy computation: \(timeElapsed) seconds")

        // Create the computation result string
        let computationResult = "Computation result for \(postId): \(result)"

        // Cache the result
        computationCache[postId] = computationResult

        // Log the computation result
        print("Computation result (new): \(computationResult)")
    }
}
