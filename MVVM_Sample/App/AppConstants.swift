//
//  AppConstants.swift
//  MVVM_Sample
//
//  Created by p10macdev06 on 24/08/18.
//  Copyright © 2018 P10. All rights reserved.
//

import Foundation

class AppConstants {
    static let DownloadUrl = "http://www.thecut.co/download"
    
    static var BarberProfileLinkDomain: String {
        switch App.apiConfiguration {
        case .development: return "book.dev.thecut.co"
        default: return "book.thecut.co"
        }
    }
    
    //Emails
    static let FeedbackEmail = "feedback@thecut.co"
    static let SupportEmail = "support@thecut.co"
    
    //Messages
    static let barberInvitingBarbersMessage = "Yo..check out this new app, theCut. It lets you schedule appointments and manage all your clients. All you have to worry about is cutting hair. Download the app at \(AppConstants.DownloadUrl)"
    
    static let clientInvitingBarberMessage = AppConstants.barberInvitingBarbersMessage
    
    static let barberInvitingClientsMessage = "Yo..check out this new app, theCut. You can use it to book your next haircut with me. Download the app at \(AppConstants.DownloadUrl)"
    
    static let clientInvitingFriendsMessage = "Yo..check out this new app, theCut. You can book an appointment with your favorite barber or find the best barber in a new city. Download the app at \(AppConstants.DownloadUrl)"
    
    static let shareBarberMessage = "Yo..this barber is sick! $name. $address. Download this new app theCut at \(AppConstants.DownloadUrl) to book appointments with them and see their work."
    
}
