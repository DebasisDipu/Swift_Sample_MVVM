//
//  ProfileImageModel.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 05/09/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


class ProfileImageModel{
    
    private(set) var imageUrl: String?
    private(set) var createdDate: String?
    private(set) var photoCredits: String?
    
    init(imageUrl: String, createdDate: String, PhotoCredits: String){
        self.imageUrl = imageUrl
        self.createdDate = createdDate
        self.photoCredits = PhotoCredits
    }
}

