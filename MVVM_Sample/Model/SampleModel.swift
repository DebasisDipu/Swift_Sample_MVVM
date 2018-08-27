//
//  SampleModel.swift
//  SampleCoreDataProj
//
//  Created by p10macdev06 on 31/07/18.
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



// struct SampleModel {
//    var name : String
//}
//
//
// class Animal {
//    var age : Int
//    
//    init(age: Int, name: String){
//        self.age = age
//       var temp = SampleModel.init(name: "Sii")
//    }
    
//}

