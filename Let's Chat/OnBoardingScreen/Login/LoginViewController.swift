//
//  LoginViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Properties
    let viewModel = LoginViewModel()
    let signUpViewModel = SignUpViewModel()
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - UI Related Methods
    private func setupUI() {
        userNameTextField.enableUnderlinedTextField()
        passwordTextField.enableUnderlinedTextField()
        loginButton.layer.cornerRadius = 20
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard userNameTextField.isNotEmpty(), passwordTextField.isNotEmpty() else { return }
        guard let email = userNameTextField.text, let password = passwordTextField.text else { return }
        startLoading()
        
        viewModel.loginUser(with: email, password: password) { status, error, user  in
            if let e = error {
                if e == .emailNotVerified {
                    self.showOptionAlert(leftOption: .cancel, rightOption: .resend, type: .emailNotVerified) {
                        if let user = user {
                            self.startLoading()
                            
                            self.signUpViewModel.sendEmailVerificationLink(for: user) { status, error in
                                if let e = error {
                                    self.showAlert(ofType: e)
                                } else {
                                    self.showAlert(ofType: .verificationEmailSent)
                                }
                                
                                self.stopLoading()
                            }
                        }
                    }
                } else {
                    self.showAlert(ofType: e)
                }
            }
            
            self.stopLoading()
        }
    }
    
}
