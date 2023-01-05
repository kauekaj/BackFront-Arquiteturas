//
//  RegisterViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = registerView
        
    }
    
    
}
