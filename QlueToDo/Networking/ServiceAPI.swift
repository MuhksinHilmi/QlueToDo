//
//  ServiceAPI.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Moya

enum ServiceAPI {
    case getList, user, todos, posting(id: Int)
}

extension ServiceAPI: TargetType {
    var headers: [String : String]? {
        switch self {
        default:
            let parameters = ["Content-Type":"application/json","Accept":"application/json"]
            return parameters
        }
    }
    var baseURL: URL {return URL(string: "https://jsonplaceholder.typicode.com")!}
    var path: String {
        switch self {
        case .posting(let id):
            return "/posts/\(id)"
        case .user:
            return "/users"
        case .todos:
            return "/todos"
        default:
            return "/posts"
        }
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var method: Moya.Method {
        switch self {
        case .posting:
            return .post
        default:
            return .get
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .posting:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    // Helper
    private func jsonSerializedUTF8(json: [String: Any]) -> Data {
        return try! JSONSerialization.data(
            withJSONObject: json,
            options: [.prettyPrinted]
        )
    }
    
    var task: Task {
        switch self {
        case .posting:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        default:
            return .requestPlain
        }
    }
}
