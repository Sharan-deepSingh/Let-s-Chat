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
}


extension UIViewController {
    
    /// This method adds the functionality of showing alerts from any view controller directly
    func showAlert(using alertMessage: AlertMessage) {
        let alert = UIAlertController(title: alertMessage.title, message: alertMessage.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        self.present(alert, animated: true)
    }
}
