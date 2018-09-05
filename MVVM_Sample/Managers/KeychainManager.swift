//
//  KeychainManager.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 04/09/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation
import Locksmith


class KeychainManager {
    
    static func getData(userId: String?, key: String) -> Any? {
        if let id = userId {
            let dictionary = Locksmith.loadDataForUserAccount(userAccount: id)
            if let dict = dictionary {
                return dict[key]
            }
        }
        
        return nil
    }
    
    static func saveData(userId: String?, key: String, value: Any) {
        if let id = userId {
            let data = Locksmith.loadDataForUserAccount(userAccount: id)
            var dictionary: [String: Any] = (data == nil) ? [:] : data!
            dictionary[key] = value
            
            do {
                try Locksmith.updateData(data: dictionary, forUserAccount: id)
            } catch {
                print("Error saving data to keychain.")
            }
        }
    }
    
    static func deleteData(userId: String?) {
        if let id = userId {
            do {
                try Locksmith.deleteDataForUserAccount(userAccount: id)
            } catch {
                print("Error deleting data from keychain.")
            }
        }
    }
    
    
    
}
