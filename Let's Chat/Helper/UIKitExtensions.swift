//
//  UIKitExtensions.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit


extension UITextField {
    
    /// This methods converts a text field to an underlined text field
    func enableUnderlinedTextField() {
        let underLine = CALayer()
        underLine.frame = CGRectMake(0.0, frame.height + 10, frame.width, 1.0)
        underLine.backgroundColor = UIColor.brandBlackBrown.cgColor
        layer.addSublayer(underLine)
    }
    
    /// Returns true if text in a text field is not empty otherwise false
    func isNotEmpty() -> Bool {
        return !(text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true)
    }
    
    /// This helps to set the text field to it's initial state i.e. empty
    func setEmpty() {
        text = ""
    }
}


extension UIViewController {
    
    /// This method adds the functionality of showing alerts from any view controller directly
    func showAlert(using alertMessage: AlertMessage) {
        let alert = UIAlertController(title: alertMessage.title, message: alertMessage.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
    
    /// This method can be used to display external error i.e. errors produced by 3rd party libraries etc,
    /// that directly provieds error string. Do not use this method for in app errors
    func showAlert(using alertMessage: String) {
        let alert = UIAlertController(title: "External Error", message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}
