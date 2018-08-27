//
//  LoginViewModel.swift
//  SampleCoreDataProj
//
//  Created by p10macdev06 on 31/07/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import UIKit


protocol GetLoginAllDelegate {
    func LoginDetails(didLoginWithEmail email:String, pass:String)

}



class LoginViewModel {

    var delagate : GetLoginAllDelegate?


    
    func SendLoginDetails(email:String, pass:String) {

        let temp =  LoginModel(email: email, password: pass)
        print(temp.email + "" + temp.password)
        
        delagate?.LoginDetails( didLoginWithEmail: temp.email , pass: temp.password )

        
    }
    
}




