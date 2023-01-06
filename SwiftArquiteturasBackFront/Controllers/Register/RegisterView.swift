//
//  RegisterView.swift
//  SwiftArquiteturasBackFront
//
//  Created by Kaue de Assis Jacyntho on 04/01/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    // MARK: - Clousures

    var onLoginTap:(() -> Void)?
    var onRegisterTap:((_ email: String, _ password: String) -> Void)?

    // MARK: - Properties
    
    lazy var emailLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Email"
        element.textColor = .black
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return element
    }()
    
    lazy var emailTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 5
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.borderWidth = 1
        element.backgroundColor = .systemGray5
        element.textColor = .gray
        element.setLeftPaddingPoints(15)
        element.placeholder = "Digite seu email"
        element.keyboardType = .emailAddress
        return element
    }()
    
    lazy var passwordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return element
    }()
    
    lazy var passwordTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 5
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.borderWidth = 1
        element.backgroundColor = .systemGray5
        element.textColor = .gray
        element.setLeftPaddingPoints(15)
        element.placeholder = "Digite sua senha"
        element.keyboardType = .default
        element.isSecureTextEntry = true
        return element
    }()
    
    lazy var confirmPasswordLabel: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.text = "Senha"
        element.textAlignment = .left
        element.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return element
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let element = UITextField()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 5
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.borderWidth = 1
        element.backgroundColor = .systemGray5
        element.textColor = .gray
        element.setLeftPaddingPoints(15)
        element.placeholder = "Confirme sua senha"
        element.keyboardType = .default
        element.isSecureTextEntry = true
        return element
    }()
    
    lazy var loginButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("Entrar", for: .normal)
        element.backgroundColor = .systemBlue
        element.layer.cornerRadius = 10
        element.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        return element
    }()
    
    
    lazy var registerButton: UIButton = {
        let element = UIButton()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.setTitle("Registrar", for: .normal)
        element.backgroundColor = .systemBlue
        element.layer.cornerRadius = 10
        element.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return element
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .viewBackgroundColor
        
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Visual elements
    
    func setVisualElements() {
        
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(confirmPasswordLabel)
        self.addSubview(confirmPasswordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)

        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            confirmPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),

            confirmPasswordTextField.topAnchor.constraint(equalTo: confirmPasswordLabel.bottomAnchor, constant: 8),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 40),

        ])
    }

    // MARK: - Actions
    
    @objc
    func loginButtonTapped() {
        self.onLoginTap?()
    }
    
    @objc
    func registerButtonTapped() {
        if let email  = emailTextField.text,
           let password = passwordTextField.text {
            self.onRegisterTap?(email, password)
        }
        // Message to inform textField must be filled
    }
    
}
