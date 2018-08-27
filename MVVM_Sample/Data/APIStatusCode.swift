//
//  APIStatusCode.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


enum APIStatusCode : Int {
    
    
    case ok = 200
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case internalServerError = 500
    case badGateway = 502
    case none = 0
    
    var isSuccess: Bool {
        return 200 <= self.rawValue && self.rawValue < 300
    }
    
    var message: String {
        switch self {
        case .ok: return "OK"
        case .badRequest: return "Bad Request"
        case .unauthorized: return "Unauthorized"
        case .forbidden: return "Forbidden"
        case .notFound: return "Not Found"
        case .internalServerError: return "Internal Server Error"
        case .badGateway: return "Bad Gateway"
        default: return "Unknown"
        }
    }
}

extension APIStatusCode: CustomStringConvertible {
    
    var description: String {
        return "<APIStatusCode> \(rawValue) - \(message)"
    }
    
}
