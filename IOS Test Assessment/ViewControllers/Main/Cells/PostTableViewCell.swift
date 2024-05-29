//
//  PostTableViewCell.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let computationCache = ComputationCache.shared

    // MARK: - Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allow multiple lines
        label.font = UIFont.systemFont(ofSize: 16) // Set desired font size
        return label
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Add titleLabel to the cell's contentView
        contentView.addSubview(titleLabel)

        // Constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String) {
        titleLabel.text = title
        let postId = Int(title.components(separatedBy: ":").first ?? "") ?? 0
        performHeavyComputation(for: postId)
    }

    private func performHeavyComputation(for postId: Int) {
        if let cachedResult = computationCache.getComputation(for: postId) {
            print("Cached result: \(cachedResult)")
            return
        }

        // Start timing
        let startTime = CFAbsoluteTimeGetCurrent()

        // Perform some heavy computation
        var result = 0
        for i in 0 ..< 10000 {
            result += i
        }

        // End timing
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        print("Time taken for heavy computation: \(timeElapsed) seconds")

        let computationResult = "Computation result for \(postId)"
        computationCache.setComputation(for: postId, result: computationResult)
    }
}
