//
//  APIRequest.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import Alamofire

typealias APIRequestHeader = Alamofire.HTTPHeaders
typealias APIRequestParameters = Alamofire.Parameters

class APIRequest {
    
    let authorize: Bool
    var reauthorize: Bool
    let method: APIMethod
    let url: Foundation.URL
    let headers: APIRequestHeader
    let parameters: APIRequestParameters
    
    var encoding: ParameterEncoding {
        return (method == .get) ? URLEncoding.default : JSONEncoding.default
    }
    
    init(
        authorize: Bool,
        reauthorize: Bool,
        method: APIMethod,
        url: Foundation.URL,
        headers: APIRequestHeader,
        parameters: APIRequestParameters)
    {
        self.authorize = authorize
        self.reauthorize = reauthorize
        self.method = method
        self.url = url
        self.headers = headers
        self.parameters = parameters
    }
    
}

extension APIRequest: CustomStringConvertible {
    
    var description: String {
        return "<\(NSStringFromClass(type(of: self)))>"
            + "\nMethod: \(method.rawValue)"
            + "\nURL: \(url.absoluteString)"
            + "\nHeaders: \(headers)"
            + "\nParameters: \(parameters)"
    }
    
}
