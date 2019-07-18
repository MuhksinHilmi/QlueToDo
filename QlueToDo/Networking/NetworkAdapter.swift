//
//  NetworkAdapter.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation

struct NetworkAdapter<T: Codable> {
    
    var request: URLRequest?
    
    func request(service: ServiceAPI, success successCallback: @escaping (T?) -> Void, error errorCallback: @escaping (String) -> Void, failure failureCallback: @escaping (Error) -> Void) {
        var baseUrl = Configuration.shared.environment.baseUrl
        baseUrl.append(service.urlPath)
        let defaultSession = URLSession(configuration: URLSessionConfiguration.ephemeral,
                                        delegate: NSURLSessionPinningDelegate(),
                                        delegateQueue: nil)
        
        var url: URL = URL(string: baseUrl)!
        if service.method == "GET", var urlComponents = URLComponents(string: baseUrl) {
            urlComponents.query = "api-key=\(token)\(service.paramaters)"
            url = urlComponents.url!
        }
        
        let task = defaultSession.dataTask(with: url) { (data, response, err) in
            guard let unwrappedData = data else { return }
            do {
                let defaults = UserDefaults.standard
                defaults.set(data, forKey: service.keyPersistent)
                
                let decoder = JSONDecoder()
                let req: T = try decoder.decode(T.self, from: unwrappedData)
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        errorCallback("error connection")
                        return
                }
                successCallback(req)
            } catch {
                errorCallback("parsing failed \(err!)")
            }
        }
        task.resume()
}
}
