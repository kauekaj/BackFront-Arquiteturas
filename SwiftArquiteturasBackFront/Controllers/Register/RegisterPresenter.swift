//
//  RegisterPresenter.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 03/01/23.
//

import Foundation

protocol RegisterPresenterDelegate {
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter {
    
    var delegate: RegisterPresenterDelegate?
    
    func register(userModel: UserModel) {
        
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: userModel.email,
                         password: userModel.password) { [weak self] userModel in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Erro", message: error?.localizedDescription ?? "Falha ao registrar, tente novamente")
        }

    }
    
}
