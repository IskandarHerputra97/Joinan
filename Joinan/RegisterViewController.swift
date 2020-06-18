//
//  RegisterViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 17/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //MARK: - PROPERTIES
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let registerButton = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Register Page"
        
        setupEmailTextField()
        setupPasswordTextField()
        setupRegisterButton()
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupEmailTextField() {
        emailTextField.borderStyle = .bezel
        emailTextField.placeholder = "Email"
    }
    
    func setupPasswordTextField() {
        passwordTextField.borderStyle = .bezel
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
    }
    
    func setupRegisterButton() {
        registerButton.setTitle("REGISTER", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = .blue
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(registerButton)
        
        setStackViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func registerButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {return}
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let user = user {
                print("user: \(user)")
                let homeViewController = HomeViewController()
                let navigationController = UINavigationController(rootViewController: homeViewController)
                self.navigationController?.present(navigationController, animated: true, completion: nil)
            }
        }
    }
}
