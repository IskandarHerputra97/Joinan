//
//  LandingPageViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 17/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    //MARK: - PROPERTIES
    let blueBookImage = UIImageView()
    let joinanLabel = UILabel()
    let tagLineLabel = UILabel()
    let getStartedButton = UIButton()
    let signInButton = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        setupBlueBookImage()
        setupJoinanLabel()
        setupTagLineLabel()
        setupGetStartedButton()
        setupSignInButton()
        setupStackView()
    }

    //MARK: - SETUP UI
    func setupBlueBookImage() {
        view.addSubview(blueBookImage)
    
        blueBookImage.contentMode = .scaleAspectFit
        blueBookImage.image = UIImage(named: "blue-book")
        
        setBlueBookImageConstraints()
    }
    
    func setupJoinanLabel() {
        joinanLabel.text = "Joinan"
        joinanLabel.textColor = .white
        joinanLabel.font = joinanLabel.font.withSize(36)
    }
    
    func setupTagLineLabel() {
        tagLineLabel.text = "Aplikasi pembelajaran online"
        tagLineLabel.textColor = .white
        tagLineLabel.font = tagLineLabel.font.withSize(24)
    }
    
    func setupGetStartedButton() {
        getStartedButton.setTitle("Get Started", for: .normal)
        getStartedButton.setTitleColor(.white, for: .normal)
        getStartedButton.backgroundColor = .blue
        
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
    }
    
    func setupSignInButton() {
        signInButton.setTitle("Already have an account? Sign In", for: .normal)
        signInButton.setTitleColor(.white, for: .normal)
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        
        stackView.addArrangedSubview(joinanLabel)
        stackView.addArrangedSubview(tagLineLabel)
        stackView.addArrangedSubview(getStartedButton)
        stackView.addArrangedSubview(signInButton)
        
        setStackViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setBlueBookImageConstraints() {
        blueBookImage.translatesAutoresizingMaskIntoConstraints = false
        blueBookImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        blueBookImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        blueBookImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        blueBookImage.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: blueBookImage.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func getStartedButtonTapped() {
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    @objc func signInButtonTapped() {
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
}

