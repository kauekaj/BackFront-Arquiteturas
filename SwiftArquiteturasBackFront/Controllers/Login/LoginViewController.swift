//
//  LoginViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    let presenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        
        if let email = emailTextField.text,
           let password = passwordTextField.text {
            
            let userModel = UserModel(email: email, password: password)
            
            presenter.login(userModel: userModel)
        }
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        self.openRegisterView()
    }
    
    func openRegisterView() {
        let homeView = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
}

extension LoginViewController: LoginPresenterDelegate {
    
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
