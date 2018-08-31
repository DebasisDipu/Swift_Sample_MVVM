//
//  App.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation


struct App {
    
    enum Environment: String {
        // This is the key in the Info.plist that specifies the environment
        // The value of the variable is dynamically loaded into the plist based on the user-defined build setting "APP_ENVIRONMENT"
        // Each build configuration can set a different vaule for this build setting
        // Each build configuration is associated with a project Scheme.
        //
        // Usage: Select the scheme to select the environment
        static var key: String { return "App_Environment" }
        case development, production
    }
    
    
    static let environment = Environment(rawValue: (Bundle.main.object(forInfoDictionaryKey: Environment.key) as! String).lowercased())!
    
    
    static var versionString: String {
        guard
            let infoDictionary = Bundle.main.infoDictionary,
            let version = infoDictionary["CFBundleShortVersionString"] as? String,
            let build = infoDictionary["CFBundleVersion"] as? String
            else {
                preconditionFailure("Why doesn't the mainBundle have an infoDictionary?")
        }
        return "\(version).\(build)"
    }
    
    static var apiConfiguration: APIConfiguration {
        switch environment {
        case .development: return .development
        case .production: return .production
        }
    }
    
    
    
}
