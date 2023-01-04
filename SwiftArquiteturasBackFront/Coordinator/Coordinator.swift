//
//  Coordinator.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 04/01/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get }
    
    func start()
    
    init(navigationController: UINavigationController)
}

//class Coordinator: CoordinatorProtocol {
//    required init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    var navigationController: UINavigationController
//    
//    func start() {
//        
//    }
//    
//    
//}
