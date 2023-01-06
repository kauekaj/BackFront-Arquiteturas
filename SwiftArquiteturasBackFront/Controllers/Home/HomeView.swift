//
//  HomeView.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 06/01/23.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    // MARK: - Properties
    
    lazy var helloLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Bem vindo a Home!"
        element.textColor = .black
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return element
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Visual elements
    
    func setVisualElements() {
        
        self.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)

        ])
    }
}
