//
//  LoginPresenter.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 03/01/23.
//

import Foundation

protocol LoginPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter {
    
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel) {
        let manager = UserManager(business: UserBusiness())
        manager.login(email: userModel.email,
                      password: userModel.password) { [weak self] userModel in
            self?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error?.localizedDescription ?? "Nao foi possível identificar o erro.")
        }
        
    }
    
    func goHome() {
        self.delegate?.goHome()
    }
    
}

extension LoginPresenter: LoginPresenterDelegate {
    func showMessage(title: String, message: String) {
        
    }
    
    
}
