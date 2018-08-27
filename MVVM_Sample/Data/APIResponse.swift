//
//  APIResponse.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import SwiftyJSON


class APIResponse {
    
    let error: APIError?
    let json: JSON
    let statusCode: APIStatusCode
    
    init(error: APIError? = nil, json: JSON? = nil, statusCode: APIStatusCode? = nil) {
        self.error = error
        self.json = json ?? JSON()
        self.statusCode = statusCode ?? .none
    }
}

extension APIResponse: CustomStringConvertible {
    
    var description: String {
        return "<\(NSStringFromClass(type(of: self)))>"
            + "\nStatus Code: \(statusCode)"
            + "\nError: \(String(describing: error))"
            + "\nJSON: \(json)"
    }
    
}
