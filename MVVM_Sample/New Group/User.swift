//
//  User.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import SwiftyJSON


class User : APIModel, Equatable {
    
    private(set) var id: String
    private(set) var userId: String
    
    init(json : JSON) {
        id = json["id"].stringValue
        userId = json["userId"].stringValue
    }
    
    
    static func createWithJSON(_ json: JSON) -> User {
        
        return User(json: json)
        
    }
    
    static func getUser(id: String, completion: @escaping (APIError?, User?) -> Void) {
        let endpoint = "/users/\(id)"
        
        apiClient.request(method: .get, endpoint: endpoint, parameters: nil) { response in
            if let err = response.error {
                return completion(err, nil)
            }
            
            let user = createWithJSON(response.json)
            completion(nil, user)
        }
    }
    
    
}
func == (lhs: User, rhs: User) -> Bool {
    return lhs.id == rhs.id
}
