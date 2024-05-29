//
//  Constants.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 29/05/24.
//

import Foundation

struct Constants {
    enum API {
        static var baseURL: String {
            return Configuration.shared.baseURL
        }
          
        static var postsEndpoint: String {
            return Configuration.shared.postsEndpoint
        }
    }
    
    /// Constants related to table view cell identifiers.
    enum TableViewCellIdentifiers {
        /// Reuse identifier for PostTableViewCell.
        static let postCell = "PostTableViewCell"
        /// Reuse identifier for LoaderTableViewCell.
        static let loaderCell = "LoaderTableViewCell"
    }
    
    /// Constants related to segue identifiers.
    enum SegueIdentifiers {
        /// Segue identifier for the show detail segue.
        static let showDetail = "ShowDetailSegue"
    }
    
    /// Constants related to messages.
    enum Messages {
        /// Message indicating that all data has been loaded.
        static let allDataLoaded = "All data loaded"
    }
}
