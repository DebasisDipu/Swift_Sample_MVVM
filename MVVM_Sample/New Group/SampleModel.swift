//
//  SampleModel.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

struct LoginModel {
    
    private(set) var email: String
    private(set) var password : String
    
    init?(string: String) {
        self.init(string: string.lowercased())
    }
    
    init(email: String, password:String) {
        self.email = email
        self.password = password
    }
    
    
    
}
