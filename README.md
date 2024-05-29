
# iOS Test Assessment

This project is an iOS application designed to fetch and display posts from a remote server using the `https://jsonplaceholder.typicode.com/posts` API. The app demonstrates key concepts in iOS development, including networking, table views, view models, and efficient data handling with caching.

## Features

- Fetches and displays posts from the JSONPlaceholder API.
- Implements a table view to display posts and a loading indicator for pagination.
- Uses a view model (`PostViewModel`) to manage the data and business logic.
- Optimizes heavy computations and caches results to improve performance.
- Provides a detail view for individual posts.
- Includes unit tests for key components.

## Project Structure

- `MainViewController.swift`: Manages the main interface of the app, displaying the list of posts.
- `PostViewModel.swift`: Handles data fetching and business logic for posts.
- `NetworkManager.swift`: Manages network requests to fetch posts.
- `DetailViewController.swift`: Displays detailed information about a selected post.
- `ComputationCache.swift`: Caches computation results to optimize performance.
- `Constants.swift`: Stores constants used throughout the project.
- `UITableView+Extensions.swift`: Adds table view cell registration extension.

## Getting Started

### Prerequisites

- Xcode 12.0 or later
- iOS 14.0 or later

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/ios-test-assessment.git
    cd ios-test-assessment
    ```

2. Open the project in Xcode:
    ```bash
    open IOS\ Test\ Assessment.xcodeproj
    ```

3. Build and run the project on your preferred simulator or device.

## Usage

### MainViewController

The main view controller manages the list of posts. It uses the `PostViewModel` to fetch data and update the table view.

### PostViewModel

The view model fetches posts from the `NetworkManager` and updates the UI through a callback. It handles pagination and ensures that data is not fetched multiple times simultaneously.

### NetworkManager

The network manager fetches posts from the JSONPlaceholder API. It handles network requests and JSON decoding.

### DetailViewController

The detail view controller displays detailed information about a selected post. It uses memoization to avoid redundant computations and re-rendering.

### ComputationCache

The computation cache stores results of heavy computations to improve performance. It uses `NSCache` for efficient in-memory storage.

## Unit Tests

The project includes unit tests for the `PostViewModel` and `NetworkManager` classes. These tests ensure that data fetching, error handling, and pagination work as expected.

To run the tests, open the project in Xcode and select `Product > Test` or press `Cmd+U`.

## Documentation

Inline documentation and comments are provided throughout the codebase to explain the purpose and functionality of each component. Here's an example of the `performHeavyComputation` method documentation:

```swift
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
    for i in 0..<10000 {
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
```

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Make sure to include tests for any new features or bug fixes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Acknowledgments

- JSONPlaceholder for providing a free API for testing and prototyping.
- The Swift community for their valuable resources and support.
