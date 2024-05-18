//
//  SignUpViewController.swift
//  Let's Chat
//
//  Created by Sharandeep Singh on 17/05/24.
//

import UIKit

class SignUpViewController: UIViewController {

    //TODO: - Disable IQKeyboardManger for this controller
    
    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
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
}
