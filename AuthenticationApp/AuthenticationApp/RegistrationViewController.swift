//
//  RegistrationViewController.swift
//  AuthenticationApp
//
//  Created by Ahmed Elbasha on 10/15/18.
//  Copyright © 2018 Ahmed Elbasha. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Optimize registerButton style.
        registerButton.backgroundColor = UIColor.white
        registerButton.layer.cornerRadius = 5
        registerButton.layer.borderWidth = 1
        registerButton.layer.borderColor = UIColor.black.cgColor
        
        // Optimize loginButton style.
        loginButton.backgroundColor = UIColor.white
        loginButton.layer.cornerRadius = 5
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func createUserButtonPressed(_ sender: Any) {
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        //let loginVC = storyboard?.instantiateViewController(withIdentifier: "<#T##String#>")
    }
}
