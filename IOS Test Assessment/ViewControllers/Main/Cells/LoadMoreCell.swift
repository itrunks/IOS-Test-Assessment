//
//  File.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import UIKit

class LoaderTableViewCell: UITableViewCell {

  /// The activity indicator view used for indicating loading state.
  var activityIndicator: UIActivityIndicatorView!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    // Create and configure the activity indicator
    activityIndicator = UIActivityIndicatorView(style: .medium)
    activityIndicator.hidesWhenStopped = true
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(activityIndicator)

    // Center the activity indicator in the cell
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  /// Starts animating the activity indicator.
  func startAnimating() {
    activityIndicator.startAnimating()
  }

  /// Stops animating the activity indicator.
  func stopAnimating() {
    activityIndicator.stopAnimating()
  }
}
