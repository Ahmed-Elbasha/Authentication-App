//
//  LoginViewController.swift
//  AuthenticationApp
//
//  Created by Ahmed Elbasha on 10/14/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Optimize loginButton style.
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
        
        // Optimize registerButton style.
        registerButton.backgroundColor = UIColor.white
        registerButton.layer.cornerRadius = 5
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
    }
}

