//
//  LoginViewModel.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation



class LoginViewModel {

    func GetUserLogin(emailTxtField: String, passwordTextField: String, completion: @escaping(AppError?, User?, UserDataModel?) -> Void )   {
        
        AuthenticationManager.sharedInstance.login(email: emailTxtField , password: passwordTextField ) { error, response, sample  in
            
            if let er = error {
                return completion(er,nil, nil)
            }
            completion(nil,response, sample)
            
        }
    }
   
}

