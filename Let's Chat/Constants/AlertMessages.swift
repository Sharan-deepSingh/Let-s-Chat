//
//  AlertMessages.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 19/05/24.
//

import Foundation

enum Alert {
    
    case dummy
}

struct AlertMessage {
    
    let title: String
    let message: String
}

struct AlertMessages {
    
    static func giveMessage(ofType alert: Alert) -> AlertMessage {
        switch alert {
            
        case .dummy:
            return AlertMessage(
                title: "",
                message: "Hello"
            )
        }
    }
}
