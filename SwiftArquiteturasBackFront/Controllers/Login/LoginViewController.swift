//
//  LoginViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Clousures
    var onRegisterTap:(() -> Void)?
    var onLoginSuccess:(() -> Void)?

        
    // MARK: - Properties
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        
        view.onRegisterTap = { [weak self] in
            self?.onRegisterTap?()
        }
        
        view.onLoginTap = { [weak self] email, password in
            self?.loginTap(email, password)
        }
        
        return view
    }()
    
    // MARK: - Overrides
    override func loadView() {
        self.view = loginView
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
    }
        
    private func loginTap(_ email: String, _ password: String) {
        
        let userViewModel = UserViewModel()
        
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
                
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
        
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email,
                      password: password) { [weak self] userModel in
            self?.onLoginSuccess?()
        } failureHandler: { [weak self] error in
            self?.showMessage("Erro", error?.localizedDescription ?? "Erro ao Logar. Tente novamente")
        }

    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
