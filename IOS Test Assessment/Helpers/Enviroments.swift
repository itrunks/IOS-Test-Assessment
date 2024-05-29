//
//  Enviroments.swift
//  IOS Test Assessment
//
//  Created by Raja Pichai on 30/05/24.
//

import Foundation

enum Environment {
    case debug
    case staging
    case UAT
    case production
}

class Configuration {
    static let shared = Configuration()

    private init() {}

    var environment: Environment {
        #if DEBUG
        return .debug
        #elseif STAGING
        return .staging
        #elseif UAT
        return .UAT
        #else
        return .production
        #endif
    }

    var baseURL: String {
        switch environment {
        case .debug:
            return "https://jsonplaceholder.typicode.com"
        case .staging:
            return "https://jsonplaceholder.typicode.com"
        case .UAT:
            return "https://jsonplaceholder.typicode.com"
        case .production:
            return "https://jsonplaceholder.typicode.com"
        }
    }

    var postsEndpoint: String {
        return "/posts"
    }
}
