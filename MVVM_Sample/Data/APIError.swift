//
//  APIError.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

enum APIError : Error, Equatable {
    
    case networkUnavailable
    case timeout
    case cancelled
    case invalidRequest(message: String)
    case invalidResponse
    case fromAPI(statusCode: APIStatusCode, json: JSON)
    case withMessage(String)
    case unknown
    
    static func from(error : Error) -> APIError{
        return .unknown
    }
    
    var message : String {
        
        switch self {
        case .networkUnavailable: return "The network is unavailable at this time."
        case .timeout: return "The network request failed to complete in a reasonable amount of time."
        case .cancelled: return "The network request was cancelled."
        case .invalidRequest(let message): return message
        case .invalidResponse: return "Invalid network response."
        case .fromAPI(let statusCode, let json):
            guard let message = json["error_description"].string else { return statusCode.message }
            return "\(message)"
        case .withMessage(let message): return message
        case .unknown: return "A network error occurred."
        }
    }
    
}

extension APIError: CustomStringConvertible {
    
    var description: String {
        return "<APIError> \(message)"
    }
    
}

func ==(lhs: APIError, rhs: APIError) -> Bool {
    switch (lhs, rhs) {
    case (.networkUnavailable, .networkUnavailable): return true
    case (.timeout, .timeout): return true
    case (.cancelled, .cancelled): return true
    case (.invalidRequest(let msg1), .invalidRequest(let msg2)): return (msg1 == msg2)
    case (.invalidResponse, .invalidResponse): return true
    case (.fromAPI(let code1, let json1), .fromAPI(let code2, let json2)): return (code1 == code2) && (json1 == json2)
    case (.withMessage(let msg1), .withMessage(let msg2)): return (msg1 == msg2)
    case (.unknown, .unknown): return true
    default: return false
    }
}
