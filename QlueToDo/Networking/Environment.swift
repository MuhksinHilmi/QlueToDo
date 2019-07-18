//
//  Environment.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation
import UIKit

enum Environment: String {
    case development = "development"
    case staging = "staging"
    case production = "production"
    
    var baseUrl: String {
        if  let path = Bundle.main.path(forResource: "DataApp", ofType: "plist"), let xml = FileManager.default.contents(atPath: path), let preferences = try? PropertyListDecoder().decode(DataApp.self, from: xml) {
            return preferences.base_url
        }
        return ""
    }
}

struct DataApp: Codable {
    var token: String
    var base_url: String
}

class Configuration {
    static let shared = Configuration()
    private init(){}
    lazy var environment: Environment = {
        if let config = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            print(config)
            if config.range(of:"staging") != nil{
                return Environment.staging
            }
            if config.range(of:"development") != nil{
                return Environment.development
            }
        }
        
        return Environment.production
    }()
}
