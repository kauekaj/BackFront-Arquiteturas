//
//  UserViewModel.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 05/01/23.
//

import Foundation

class UserViewModel {
    
    private let model: UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init() {
        self.model = UserModel()
    }
    
    var email: String {
        model.email
    }
    
    func getUserFromApi(_ email: String, _ password: String, completion: @escaping (Result<UserViewModel, Error>) -> Void) {
        
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email,
                      password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: { error in
            completion(.failure(error!))
        }

    }
}
