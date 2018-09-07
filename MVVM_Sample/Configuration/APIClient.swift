  //
//  APIClient.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIClient {
    
    private let configuration: APIConfiguration
    private let sessionManager: Alamofire.SessionManager
    
    var authenticationProvider: APIAuthenticationProvider
    
    init(authenticationProvider: APIAuthenticationProvider = DefaultAuthenticationProvider()) {
        self.configuration = App.apiConfiguration
        self.authenticationProvider = authenticationProvider
        
        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            configuration.baseURL.host!: .disableEvaluation
        ]
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = configuration.timeout
        
        sessionManager = Alamofire.SessionManager(
            configuration: config,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }
    
    func request(
        authorize: Bool = true,
        reauthorize: Bool = true,
        method: APIMethod,
        endpoint: String,
        parameters: APIRequestParameters? = nil,
        completion: @escaping (APIResponse) -> Void)
    {
        
        if let url = URL(string: configuration.URLForEndpoint(endpoint)){
            request(authorize: authorize, reauthorize: reauthorize, method: method, url: url, parameters: parameters, completion: completion)
        }
 
    }
    
    func request(
        authorize: Bool = true,
        reauthorize: Bool = true,
        method: APIMethod,
        url: Foundation.URL,
        parameters: APIRequestParameters? = nil,
        completion: @escaping (APIResponse) -> Void)
    {
        let params: APIRequestParameters = (parameters == nil) ? [:] : parameters!
        var headers: APIRequestHeader = [:]
        
        if (authorize) {
            let token = authenticationProvider.accessToken
            headers["Authorization"] = "Bearer \((token == nil) ? "" : token!)"
        }
        
        let request = APIRequest(authorize: authorize, reauthorize: reauthorize, method: method, url: url, headers: headers, parameters: params)
        
        makeRequest(request, completion: completion)
    }
    
    private func makeRequest(_ request: APIRequest, completion: @escaping (APIResponse) -> Void) {
        //        logd("\(request)")
        
        sessionManager.request(request.url, method: request.method, parameters: request.parameters, encoding: request.encoding, headers: request.headers).responseJSON { response in
            
            if (self.needsReauthorization(request: request, response: response)) {
                
                return self.authenticationProvider.reauthorize { success in
                    if (!success) {
                        self.authenticationProvider.unauthorize()
                        return self.handleResponse(response, completion: completion)
                    }
                    
                    self.request(authorize: true, reauthorize: false, method: request.method, url: request.url, parameters: request.parameters, completion: completion)
                }
            }   
            else if (self.needsUnauthorization(request: request, response: response)) {
                self.authenticationProvider.unauthorize()
            }
            
            self.handleResponse(response, completion: completion)
        }
    }
    
    private func handleResponse(_ response: DataResponse<Any>, completion: (APIResponse) -> Void) {
        let error = response.error
        let value = response.value ?? [:]
        
        var apiResponse: APIResponse!
        var apiError: APIError? = nil
        let json = JSON(value)
        
        if let statusCode = getStatusCode(response: response) {
            if (!statusCode.isSuccess) {
                apiError = .fromAPI(statusCode: statusCode, json: json)
            }
            else if let err = error {
                apiError = .from(error: err)
            }
            
            apiResponse = APIResponse(error: apiError, json: json, statusCode: statusCode)
        }
        else {
            if let err = error {
                apiError = .from(error: err)
            }
            else {
                apiError = .unknown
            }
            
            apiResponse = APIResponse(error: apiError, json: json)
        }
        
        //        logd("\(apiResponse)")
        completion(apiResponse)
    }
    
    private func needsReauthorization(request: APIRequest, response: DataResponse<Any>) -> Bool {
        guard let statusCode = getStatusCode(response: response) else { return false }
        return request.authorize && request.reauthorize && statusCode == .unauthorized
    }
    
    private func needsUnauthorization(request: APIRequest, response: DataResponse<Any>) -> Bool {
        guard let statusCode = getStatusCode(response: response) else { return false }
        return request.authorize && !request.reauthorize && statusCode == .unauthorized
    }
    
    private func getStatusCode(response: DataResponse<Any>) -> APIStatusCode? {
        guard
            let rawStatusCode = response.response?.statusCode,
            let statusCode = APIStatusCode(rawValue: rawStatusCode)
            else {
                return nil
        }
        
        return statusCode
    }
    
    
}
