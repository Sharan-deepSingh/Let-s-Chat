//
//  AlertMessages.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 19/05/24.
//

import Foundation


enum Alert {
    
    case unknownError
    case allRequired
    case passwordMissmatch
    case userNameNotAvailable
}


struct AlertMessage {
    
    let title: String
    let message: String
}


struct AlertMessages {
    
    static let unknownError = "Unknown Error"
    
    static func giveMessage(ofType alert: Alert) -> AlertMessage {
        switch alert {
        
        case .unknownError:
            return AlertMessage(
                title: "Error",
                message: "Unknown Error"
            )
        case .allRequired:
            return AlertMessage(
                title: "Error",
                message: "All fields are required"
            )
        case .passwordMissmatch:
            return AlertMessage(
                title: "Error",
                message: "Password does not match"
            )
        case .userNameNotAvailable:
            return AlertMessage(
                title: "Error",
                message: "Username not available, please try with new one"
            )
        }
    }
    
    
    /// Helps to make an AlertMessage which is a sturct in this file from an error
    /// - Parameter error: A parameter that includes details of error
    /// - Returns: Returns alert message that includes title and message
    static func makeAlertMessage(from error: Error) -> AlertMessage {
        return AlertMessage(
            title: "Error",
            message: error.localizedDescription
        )
    }
}
