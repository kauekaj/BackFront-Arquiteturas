//
//  HomeViewController.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 29/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeView: HomeView = {
        let view = HomeView(frame: .zero)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .viewBackgroundColor
    }
    
    
}
