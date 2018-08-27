//
//  APIService.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


class APIService {
    
    var apiClient : APIClient{
        return APIManager.sharedInstance.apiClient
    }
    
}
