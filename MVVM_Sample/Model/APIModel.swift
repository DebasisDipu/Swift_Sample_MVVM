//
//  APIModel.swift
//  SampleCoreDataProj
//
//  Created by p10macdev06 on 07/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


class APIModel {
    
    static var apiClient: APIClient {
        return APIManager.sharedInstance.apiClient
    }
    
    var apiClient: APIClient {
        return APIManager.sharedInstance.apiClient
    }
    
    init() {}
    
    func parameterize() -> APIRequestParameters {
        return [:]
    }
    
    
}
