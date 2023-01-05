//
//  HomeCoordinator.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 05/01/23.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    func start() {
        
    }
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
}
