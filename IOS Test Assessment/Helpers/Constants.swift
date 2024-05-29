//
//  Constants.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import Foundation

struct Constants {
    /// Constants related to table view cell identifiers.
    struct TableViewCellIdentifiers {
        /// Reuse identifier for PostTableViewCell.
        static let postCell = "PostTableViewCell"
        /// Reuse identifier for LoaderTableViewCell.
        static let loaderCell = "LoaderTableViewCell"
    }
    
    /// Constants related to segue identifiers.
    struct SegueIdentifiers {
        /// Segue identifier for the show detail segue.
        static let showDetail = "ShowDetailSegue"
    }
    
    /// Constants related to messages.
    struct Messages {
        /// Message indicating that all data has been loaded.
        static let allDataLoaded = "All data loaded"
    }
}

