//
//  Configuration.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 14/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


public enum PlistKey{
    case ServerURL
    case TimeoutInterval
    case ConnectionProtocol
    
    func value() -> String {
        
        switch self {
        case .ServerURL:
            return "server_url"
        case .TimeoutInterval:
            return "timeout_interval"
        case .ConnectionProtocol:
            return "protocol"
        }
        
    }
}


public struct Environment {
    
    fileprivate var infoDict: [String:Any] {
        get{
            if let dict = Bundle.main.infoDictionary{
                return dict
            }else{
                fatalError("Plist not found!")
            }
        }
    }
    
    public func configuration(_ key: PlistKey) -> String{
        switch key {
        case .ServerURL:
            return infoDict[PlistKey.ServerURL.value()] as! String
        case .TimeoutInterval:
            return infoDict[PlistKey.TimeoutInterval.value()] as! String
        case .ConnectionProtocol:
            return infoDict[PlistKey.ConnectionProtocol.value()] as! String
        }
    }
    
    
}
