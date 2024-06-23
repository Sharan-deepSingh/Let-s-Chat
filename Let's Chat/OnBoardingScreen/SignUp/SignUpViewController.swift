//
//  SignUpViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK: - Instances
    private let viewModel = SignUpViewModel()
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - UI Related Methods
    private func setupUI() {
        emailTextField.enableUnderlinedTextField()
        usernameTextField.enableUnderlinedTextField()
        passwordTextField.enableUnderlinedTextField()
        confirmPasswordTextField.enableUnderlinedTextField()
        signUpButton.layer.cornerRadius = 20
    }
    
    //MARK: - IBActions
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
         //TODO: - Currently we are checking empty text field manually but in case this check requires at multiple places make a more generalised, readable, professional looking and common way for all to check this.
        
        guard emailTextField.isNotEmpty(), usernameTextField.isNotEmpty(), passwordTextField.isNotEmpty(),
              confirmPasswordTextField.isNotEmpty() else {
            
            showAlert(ofType: .allRequired)
            
            return
        }
        
        //TODO: - I am not sure weather it is an appropriate place to check for conditions for text fields validation or we should do this stuff in view model so, in case if view model if more appropriate do that in future
        
        guard passwordTextField.text == confirmPasswordTextField.text else {
            passwordTextField.setEmpty()
            confirmPasswordTextField.setEmpty()
            showAlert(ofType: .passwordMissmatch)
            
            return
        }
        
        if let email = emailTextField.text, let username = usernameTextField.text, let password = passwordTextField.text {
            startLoading()
            
            viewModel.registerNewUser(email: email, userName: username, password: password) { isSuccessful, error in
                if let alertMessage = error {
                    self.showAlert(ofType: alertMessage)
                }
                
                self.stopLoading()
                
                self.showAlert(ofType: .verificationEmailSent) {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
