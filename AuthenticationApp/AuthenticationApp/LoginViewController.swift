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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    @IBAction func signInButtonPressed(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                if error == nil {
                    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(homeVC!, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        } else {
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "Registration")
        self.present(registerVC!, animated: true, completion: nil)
    }
}

