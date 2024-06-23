//
//  UIKitExtensions.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit
import NVActivityIndicatorView

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
    
    /// This struct helps to store views with in this extension so that these views can be easily accessed from
    ///  any other method with in the scope. These views are required for startLoading and stopLoading.
    private struct LoaderProperties {
        static var loadingView: NVActivityIndicatorView?
        static var backgroundView: UIView?
    }
    
    /// This method adds the functionality of showing alerts from any view controller directly
    func showAlert(ofType type: Alert, completion: (() -> Void)? = nil) {
        let alertMessage = AlertMessages.giveMessage(ofType: type)
        
        let alert = UIAlertController(
            title: alertMessage.title,
            message: alertMessage.message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { _ in
                    completion?()
                }
            )
        )
        
        present(alert, animated: true)
    }
    
    func showOptionAlert(leftOption: StringConstant,
                         rightOption: StringConstant,
                         type: Alert,
                         closure: @escaping () -> Void) {
        let alertMessage = AlertMessages.giveMessage(ofType: type)
        
        let alert = UIAlertController(
            title: alertMessage.title,
            message: alertMessage.message,
            preferredStyle: .alert
        )
        
        let leftAction = UIAlertAction(title: leftOption.rawValue, style: .cancel)
        let rightAction = UIAlertAction(title: rightOption.rawValue, style: .default) { _ in
            closure()
        }
        
        alert.addAction(leftAction)
        alert.addAction(rightAction)
        
        present(alert, animated: true)
    }
    
    /// This method can be used to freeze the screen and show a loader to give illusion to user that data is loading
    func startLoading() {
        setupActivityIndicatorView()
        LoaderProperties.loadingView?.startAnimating()
    }
    
    /// This method helps to setup ui for loader, which we display using startLoading() mehtod
    private func setupActivityIndicatorView() {
        guard LoaderProperties.backgroundView == nil, LoaderProperties.loadingView == nil else { return }
        
        let backgroundView = UIView()
                
        backgroundView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        LoaderProperties.backgroundView = backgroundView
        
        var loadingView: NVActivityIndicatorView
        let size: CGFloat = 50.0
        let frame = CGRect(x: (view.frame.width - size) / 2,
                           y: (view.frame.height - size) / 2,
                           width: size,
                           height: size)

        loadingView = NVActivityIndicatorView(frame: frame, type: .ballPulseSync, color: .brandBlackBrown, padding: 0)
        backgroundView.addSubview(loadingView)
        LoaderProperties.loadingView = loadingView
    }
    
    /// This method can be used to dismiss loader which is started displaying using startLoading() method
    func stopLoading() {
        LoaderProperties.loadingView?.stopAnimating()
        LoaderProperties.backgroundView?.removeFromSuperview()
        
        LoaderProperties.loadingView = nil
        LoaderProperties.backgroundView = nil
    }
}
