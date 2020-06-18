//
//  PelajaranDetailNotEnrolledViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class PelajaranDetailNotEnrolledViewController: UIViewController {

    //MARK: - PROPERTIES
    let pelajaranDescriptionLabel = UILabel()
    let namaPengajarLabel = UILabel()
    let bioPengajarLabel = UILabel()
    let enrollButton = UIButton()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
       
        
        setupPelajaranDescriptionLabel()
        setupNamaPengajarLabel()
        setupBioPengajarLabel()
        setupEnrollButton()
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupPelajaranDescriptionLabel() {
        pelajaranDescriptionLabel.numberOfLines = 0
        pelajaranDescriptionLabel.text = "Pelajaran 1 merupakan course tentang Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        
    }
    
    func setupNamaPengajarLabel() {
        namaPengajarLabel.text = "John Doe"
    }
    
    func setupBioPengajarLabel() {
        bioPengajarLabel.numberOfLines = 0
        bioPengajarLabel.text = "Berpengalaman 10 tahun dalam bidang pelajaran 1, pernah mendapat penghargaan lorem ipsum"
    }
    
    func setupEnrollButton() {
        enrollButton.setTitle("Enroll", for: .normal)
        enrollButton.backgroundColor = .blue
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        
        stackView.addArrangedSubview(pelajaranDescriptionLabel)
        stackView.addArrangedSubview(namaPengajarLabel)
        stackView.addArrangedSubview(bioPengajarLabel)
        stackView.addArrangedSubview(enrollButton)
        
        setStackViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: ACTIONS
    @objc func enrollButtonTapped() {
        print("Enroll button tapped")
    }
}
