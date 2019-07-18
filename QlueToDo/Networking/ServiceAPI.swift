//
//  ServiceAPI.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

enum ServiceAPI {
    case post, user, todos
    var urlPath: String {
        switch self {
        case .post
            return "/posts"
        case .user:
            return "/users"
        case .todos:
            return "/todos"
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var paramaters: String {
        switch self {
        case .content(limit: let limit):
            return "&limit=\(limit)"
        default:
            return ""
        }
    }
    
    var keyPersistent: String {
        switch self {
        case .content:
            return "content_news"
        case .search:
            return "search"
        default:
            return "default"
        }
    }
}
