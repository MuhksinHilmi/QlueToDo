//
//  NetworkAdapter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Moya

enum Result<S, E> where E: Error {
    case success(S), error(E)
}

protocol FetchApiService {
    var serviceApi: ServiceAPI { get }
    func fetch<T: Codable>(decodingType: [T].Type, completionHandler completion: @escaping JSONTaskCompletionHandler)
}

extension FetchApiService {
    typealias JSONTaskCompletionHandler = (Codable?, APIError?) -> Void
    func fetch<T: Codable>(decodingType: [T].Type, completionHandler completion: @escaping JSONTaskCompletionHandler) {
        let provider = MoyaProvider<ServiceAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
        provider.request(serviceApi) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let genericModel = try decoder.decode(decodingType, from: response.data)
                    
                    if response.statusCode >= 200 && response.statusCode < 300 {
                        completion(genericModel, nil)
                    } else {
                        completion(nil, .responseUnsuccessful)
                    }
                }catch {
                    completion(nil, .jsonConversionFailure)
                }
            case .failure( _):
                completion(nil, .invalidData)
            }
        }
    }
}
