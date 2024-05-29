//
//  UITableview+Extension.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import UIKit

extension UITableView {
  /// Registers the necessary table view cells for reuse.
  func registerCells() {
    // Register PostTableViewCell for postCell reuse identifier
    self.register(
      PostTableViewCell.self, forCellReuseIdentifier: Constants.TableViewCellIdentifiers.postCell)

    // Register LoaderTableViewCell for loaderCell reuse identifier
    self.register(
      LoaderTableViewCell.self,
      forCellReuseIdentifier: Constants.TableViewCellIdentifiers.loaderCell)
  }
}
