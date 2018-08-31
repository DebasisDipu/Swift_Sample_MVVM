//
//  APIConfiguration.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


enum APIConfiguration {
    
    case development
    case production
    case custom(baseUrl: String, clientIdentifier: String, clientSecret: String)
    
    var baseURL: URL! {
        if (localhost) {
            return URL(string: "https://api-beta.truefoodies.com/api/Ftfo_users")
        }
        
        switch self {
        case .development: return URL(string: "https://api-beta.truefoodies.com/api/Ftfo_users")
        case .production: return URL(string: "https://thecut-production.us-east-1.elasticbeanstalk.com/v1")
        case .custom(let url, _, _): return URL(string: url)
        }
    }
    
    var clientIdentifier: String {
        switch self {
        case .development: return "772f47be-e32e-44ae-9448-5d5711092984"
        case .production: return "34fffafb-f197-41e0-91b1-fecaaf48e56c"
        case .custom(_, let identifer, _): return identifer
        }
    }
    
    var clientSecret: String {
        switch self {
        case .development: return "80fca04e-1b64-4cb5-a91f-4092fdd1a7b8"
        case .production: return "a1d4d9f6-f686-48fa-b4b9-9a7900a3ba19"
        case .custom(_, _, let secret): return secret
        }
    }
    
    var timeout: Foundation.TimeInterval { return 20 }
    
    var localhost: Bool { return false }
    
    func URLForEndpoint(_ endpoint: String?) -> String {
        
        return baseURL.appendingPathComponent(endpoint ?? "").absoluteString.removingPercentEncoding!
        
//        return  baseURL.appendingPathComponent(endpoint).absoluteString
    }
}
