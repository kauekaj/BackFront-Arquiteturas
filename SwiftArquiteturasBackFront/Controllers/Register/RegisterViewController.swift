//
//  RegisterViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    let presenter = RegisterPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.delegate = self
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        if let email = emailTextField.text,
           let password = passwordTextField.text,
           let confirmPassword = confirmPasswordTextField.text {
            
            if password != confirmPassword {
                self.showMessage(title: "Erro", message: "As senhas não conferem")
                return
            }
            
            let userModel = UserModel(email: email, password: password)
            
            presenter.register(userModel: userModel)
        }
    }
}

extension RegisterViewController: RegisterPresenterDelegate {
    
    func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func goHome() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    
}
