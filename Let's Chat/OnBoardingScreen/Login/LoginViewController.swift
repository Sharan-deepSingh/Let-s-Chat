//
//  LoginViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit
import FirebaseAuth

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
        
        viewModel.loginUser(with: email, password: password) { [weak self] status, error, user  in
            guard let self = self else { return }
            
            stopLoading()

            if let e = error {
                if e == .emailNotVerified {
                    showOptionAlert(leftOption: .cancel,
                                    rightOption: .resend,
                                    type: .emailNotVerified) { [weak self] in
                        guard let self = self else { return }
                        
                        if let user = user {
                            startLoading()
                            
                            signUpViewModel.sendEmailVerificationLink(for: user) { [weak self] status, error in
                                guard let self = self else { return }
                                
                                if let e = error {
                                    showAlert(ofType: e)
                                } else {
                                    showAlert(ofType: .verificationEmailSent)
                                }
                                
                                stopLoading()
                            }
                        }
                    }
                } else {
                    showAlert(ofType: e)
                }
            } else {
                pushViewController(from: .Chat, using: .ChatViewController)
            }
        }
    }
}
