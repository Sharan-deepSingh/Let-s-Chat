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
}
