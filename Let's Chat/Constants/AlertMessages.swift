//
//  AlertMessages.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 19/05/24.
//

import Foundation

/// Equatable is used when we want to enable comparison of its objects
enum Alert: Equatable {
    
    case externalError(String)
    case unknownError
    case allRequired
    case passwordMissmatch
    case userNameNotAvailable
    case verificationEmailSent
    case emailNotVerified
}


struct AlertMessage {
    
    let title: String
    let message: String
}


struct AlertMessages {
        
    static func giveMessage(ofType alert: Alert) -> AlertMessage {
        switch alert {
        
        case .externalError(let message):
            return AlertMessage(
                title: "External Error",
                message: message
            )
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
        case .verificationEmailSent:
            return AlertMessage(
                title: "Success",
                message: """
                         We've sent you a verification link through email, please check your mail box and
                         click the link to verify your email. Once the email get's verified you will be
                         able to login to your account 😉
                         """
            )
        case .emailNotVerified:
            return AlertMessage(
                title: "Verification Failed",
                message: """
                         Your email is not verified yet, check your mail box and verify your email or click
                         resend to get a fresh verification link
                         """
            )
        }
    }
}
