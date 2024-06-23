//
//  AppConstants.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 24/05/24.
//

import Foundation

enum StringConstant: String {
    
    case close = "Close"
    case cancel = "Cancel"
    case resend = "Resend"
}

struct AppConstants {
    
    struct DynamicLinks {
        
        static let emailVerification = "https://letschatteam.page.link/email-verification"
    }
    
    struct FireStore {
        
        static let userTable = "Users Table"
        static let userName = "username"
    }
}
