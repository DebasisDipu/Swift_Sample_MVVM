//
//  AuthenticationService.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

class AuthenticationService: APIService {
    
    
    func logIn(name: String, password: String, completion: @escaping (APIError?, User?) -> Void) {
        
        let endpoint = "/login?include=user"
        
        var parameters: APIRequestParameters = [
            "email": name,
            "password": password,
            ]
        
        parameters = addAuthorizationParameters(parameters)
        
        apiClient.request(authorize: false, method: .post, endpoint: endpoint, parameters: parameters) { response in
            if let err = response.error {
                return completion(err, nil)
            }
            
            let user = User.createWithJSON(response.json)

            
            completion(nil,user)
        }
        
        
    }
    
    
    
    func requestToken(email: String, password: String, completion: @escaping (APIError?, User?, String?, String?, Int?) -> Void) {
        let parameters: APIRequestParameters = [
            "grant_type": "password",
            "username": email,
            "password": password
        ]
        
        makeTokenRequest(parameters: parameters) { error, user, accessToken, refreshToken, expiresIn in
            if let err = error {
                switch err {
                case .fromAPI(let statusCode, _):
                    if (statusCode == .forbidden) {
                        return completion(.withMessage("Invalid email/password."), nil, nil, nil, nil)
                    }
                    
                    fallthrough
                default:
                    return completion(err, nil, nil, nil, nil)
                }
            }
            
            completion(nil, user, accessToken, refreshToken, expiresIn)
        }
    }
    
    func refreshToken(refreshToken: String, completion: @escaping (APIError?, User?, String?, String?, Int?) -> Void) {
        let parameters: APIRequestParameters = [
            "grant_type": "refresh_token",
            "refresh_token": refreshToken
        ]
        
        makeTokenRequest(parameters: parameters, completion: completion)
    }
    
    func resetPassword(email: String, completion: @escaping (APIError?) -> Void) {
        let endpoint = "/auth/reset-password"
        
        var parameters: APIRequestParameters = [
            "email": email,
            ]
        
        parameters = addAuthorizationParameters(parameters)
        
        apiClient.request(authorize: false, method: .post, endpoint: endpoint, parameters: parameters) { response in
            if let err = response.error {
                return completion(err)
            }
            
            completion(nil)
        }
    }
    
    private func addAuthorizationParameters(_ parameters: APIRequestParameters) -> APIRequestParameters {
        let configuration = App.apiConfiguration
        
        var params = parameters
//        params["client_id"] = configuration.clientIdentifier
//        params["client_secret"] = configuration.clientSecret
//        
        return params
    }
    
    private func makeTokenRequest(parameters: APIRequestParameters, completion: @escaping (APIError?, User?, String?, String?, Int?) -> Void) {
        let endpoint = "/auth/token"
        
        let params = addAuthorizationParameters(parameters)
        
        apiClient.request(authorize: false, method: .post, endpoint: endpoint, parameters: params) { response in
            if let err = response.error {
                return completion(err, nil, nil, nil, nil)
            }
            
            let user = User.createWithJSON(response.json["user"])
            let accessToken = response.json["access_token"].stringValue
            let refreshToken = response.json["refresh_token"].stringValue
            let expiresIn = response.json["expires_in"].intValue
            
            completion(nil, user, accessToken, refreshToken, expiresIn)
        }
}

}
