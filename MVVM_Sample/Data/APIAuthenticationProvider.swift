//
//  APIAuthenticationProvider.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

protocol APIAuthenticationProvider {
    
    var accessToken: String? { get }
    
    func reauthorize(completion: @escaping (Bool) -> Void)
    func unauthorize()
    
}


class DefaultAuthenticationProvider : APIAuthenticationProvider{
    func reauthorize(completion: @escaping (Bool) -> Void) {
        completion(false)
    }
    
    func unauthorize() {
        
    }
    
    
    var accessToken: String?{
        return nil
    }
    
}
