//
//  SampleModel.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDataModel: APIModel {
        
    private(set) var firstName: String?
    private(set) var favRestPublished : Bool
    private(set) var profilePicture: ProfileImageModel?
    private(set) var id: String?
    
//    init?(string: String) {
//        self.init(string: string.lowercased())
//    }
    
    init(json: JSON) {
        self.firstName = json["firstName"].stringValue
        self.favRestPublished = json["favRestPublished"].boolValue
        self.profilePicture = ProfileImageModel(json: json)
        self.id = json["id"].stringValue

    }
    
    
    
}
