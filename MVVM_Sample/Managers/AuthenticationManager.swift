//
//  AuthenticationManager.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

class AuthenticationManager{
    
    static let sharedInstance = AuthenticationManager()
    
    let authenticationService = AuthenticationService()
    
    
    var authenticatedUserId: String? = "1"
    
    //        {
    //        get {
    //            return "1"
    //           // return UserDefaultsManager.get(key: "authenticatedUser")
    //        }
    //        set {
    //            return 1
    //
    ////            UserDefaultsManager.set(key: "authenticatedUser", value: newValue)
    //        }
    //    }
    
    var authenticatedUser: User? {
        didSet {
            authenticatedUserId = authenticatedUser?.id
        }
    }
    //
    //    var isAuthenticated: Bool {
    //        return authenticatedUserId != nil && authenticatedUserId != ""
    //    }
    //
    //    var accessToken: String? {
    //        get {
    //            return KeychainManager.getData(userId: authenticatedUserId, key: "accessToken") as? String
    //        }
    //        set {
    //            KeychainManager.saveData(userId: authenticatedUserId, key: "accessToken", value: (newValue == nil) ? "" : newValue!)
    //        }
    //    }
    //
    //    var refreshToken: String? {
    //        get {
    //            return KeychainManager.getData(userId: authenticatedUserId, key: "refreshToken") as? String
    //        }
    //        set {
    //            KeychainManager.saveData(userId: authenticatedUserId, key: "refreshToken", value: (newValue == nil) ? "" : newValue!)
    //        }
    //    }
    //
    //    var expiresIn: Int? {
    //        get {
    //            return KeychainManager.getData(userId: authenticatedUserId, key: "expiresIn") as? Int
    //        }
    //        set {
    //            KeychainManager.saveData(userId: authenticatedUserId, key: "expiresIn", value: (newValue == nil) ? 0 : newValue!)
    //        }
    //    }
    
    
    func login(email: String, password: String, completion: @escaping (AppError?) -> Void) {
        

        
        authenticationService.logIn(name: email, password: password) {
            error in
                if let err = error{
                    return completion(.apiError(err))
                }
            
            
            completion(nil)
            
            
        }
        
//        authenticationService.requestToken(email: email, password: password) { error, user, accessToken, refreshToken, expiresIn in
//            if let err = error {
//                return completion(.apiError(err), nil)
//            }
//
//            //            self.authenticatedUser = user
//            //            self.accessToken = accessToken
//            //            self.refreshToken = refreshToken
//            //            self.expiresIn = expiresIn
//            //
//            //            self.postNotification(.UserLoggedIn)
//            completion(nil, self.authenticatedUser)
//        }
    }
    
    
}
