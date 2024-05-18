//
//  UIElementsExtensions.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit


extension UITextField {
    
    func enableUnderlinedTextField() {
        let underLine = CALayer()
        underLine.frame = CGRectMake(0.0, frame.height + 10, frame.width, 1.0)
        underLine.backgroundColor = UIColor.brandBlackBrown.cgColor
        layer.addSublayer(underLine)
    }
}
