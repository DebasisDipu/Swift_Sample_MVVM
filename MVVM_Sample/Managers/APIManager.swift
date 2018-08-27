//
//  APIManager.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

class APIManager {
    
    static let sharedInstance = APIManager()
    
    private(set) var apiClient = APIClient()
    
    private init() {}
    
    static func configure(authenticationProvider: APIAuthenticationProvider){
        sharedInstance.apiClient.authenticationProvider = authenticationProvider
    }
    
}
