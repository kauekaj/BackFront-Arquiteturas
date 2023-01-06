//
//  RegisterCoordinator.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 05/01/23.
//

import Foundation
import UIKit

class RegisterCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        let viewController = RegisterViewController()
        
        viewController.onLoginTap = {
            self.navigationController.popToRootViewController(animated: true)
        }
        
        viewController.onRegisterSuccess = {
            let coordinator = HomeCoordinator(navigationController: self.navigationController)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)

    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
