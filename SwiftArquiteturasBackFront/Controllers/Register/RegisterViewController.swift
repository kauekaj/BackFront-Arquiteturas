//
//  RegisterViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Clousures
    var onLoginTap:(() -> Void)?
    var onRegisterSuccess:(() -> Void)?
    
    // MARK: - Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        
        view.onLoginTap = { [weak self] in
            self?.onLoginTap?()
        }
        
        view.onRegisterTap = { [weak self] email, password in
            self?.registerTap(email, password)
        }
        
        return view
    }()
    
    
    // MARK: - Overrides
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Registro"
    }
    
    // MARK: - Actions
    private func registerTap(_ email: String, _ password: String) {
        
        let userViewModel = UserViewModel()
        
        userViewModel.setUserIntoApi(email, password) { [weak self] result in
            switch result {
                
            case .success(_):
                self?.onRegisterSuccess?()
            case .failure(let error):
                self?.showMessage("Erro", error.localizedDescription)
            }
        }
        
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
