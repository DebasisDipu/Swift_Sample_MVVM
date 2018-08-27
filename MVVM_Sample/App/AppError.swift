//
//  AppError.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

enum AppError : Error {
    
    case apiError(APIError)
    case withMessage(String)
    case fromError(Error)
    case `default`
    
    static var defaultMessage : String {
        return "An error occured"
    }
    
    var message: String {
        switch self {
        case .apiError(let error): return error.message
        case .withMessage(let message): return message
        case .fromError(_): return AppError.defaultMessage
        case .default: return AppError.defaultMessage
        }
    }
    
}
