//
//  PelajaranDetailEnrolledViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class PelajaranDetailEnrolledViewController: UIViewController {
    
    //MARK: - PROPERTIES
    let pelajaranDescriptionLabel = UILabel()
    let namaPengajarLabel = UILabel()
    let bioPengajarLabel = UILabel()
    let requestPertemuanButton = UIButton()
    let courseEnrolledLabel = UILabel()
    let mulaiBelajarButton = UIButton()
    let assignmentButton = UIButton()
    let finalQuizButton = UIButton()
    let horizontalStackView = UIStackView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupPelajaranDescriptionLabel()
        setupNamaPengajarLabel()
        setupBioPengajarLabel()
        setupRequestPertemuanButton()
        setupCourseEnrolledLabel()
        setupMulaiBelajarButton()
        setupAssignmentButton()
        setupFinalQuizButton()
        setupHorizontalStackView()
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
    
    func setupRequestPertemuanButton() {
        requestPertemuanButton.setTitle("Request pertemuan", for: .normal)
        requestPertemuanButton.backgroundColor = .blue
        
        requestPertemuanButton.addTarget(self, action: #selector(requestPertemuanButtonTapped), for: .touchUpInside)
    }
    
    func setupCourseEnrolledLabel() {
        courseEnrolledLabel.numberOfLines = 0
        courseEnrolledLabel.text = "Anda sudah mengambil course ini"
        courseEnrolledLabel.textColor = .blue
    }
    
    func setupMulaiBelajarButton() {
        mulaiBelajarButton.setTitle("Mulai belajar", for: .normal)
        mulaiBelajarButton.setTitleColor(.white, for: .normal)
        mulaiBelajarButton.backgroundColor = .blue
        
        mulaiBelajarButton.addTarget(self, action: #selector(mulaiBelajarButtonTapped), for: .touchUpInside)
    }
    
    func setupAssignmentButton() {
        assignmentButton.setTitle("Assignment", for: .normal)
        assignmentButton.setTitleColor(.white, for: .normal)
        assignmentButton.backgroundColor = .blue
        
        assignmentButton.addTarget(self, action: #selector(assignmentButtonTapped), for: .touchUpInside)
    }
    
    func setupFinalQuizButton() {
        finalQuizButton.setTitle("Final quiz", for: .normal)
        finalQuizButton.setTitleColor(.white, for: .normal)
        finalQuizButton.backgroundColor = .blue
        
        finalQuizButton.addTarget(self, action: #selector(finalQuizButtonTapped), for: .touchUpInside)
    }
    
    func setupHorizontalStackView() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 20
        
        horizontalStackView.addArrangedSubview(mulaiBelajarButton)
        horizontalStackView.addArrangedSubview(assignmentButton)
        horizontalStackView.addArrangedSubview(finalQuizButton)
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        
        stackView.addArrangedSubview(pelajaranDescriptionLabel)
        stackView.addArrangedSubview(namaPengajarLabel)
        stackView.addArrangedSubview(bioPengajarLabel)
        stackView.addArrangedSubview(requestPertemuanButton)
        stackView.addArrangedSubview(courseEnrolledLabel)
        stackView.addArrangedSubview(horizontalStackView)
        
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
    @objc func requestPertemuanButtonTapped() {
        print("Request pertemuan button tapped")
    }
    
    @objc func mulaiBelajarButtonTapped() {
        print("Mulai belajar button tapped")
    }
    
    @objc func assignmentButtonTapped() {
        print("Assingment button tapped")
    }
    
    @objc func finalQuizButtonTapped() {
        print("Final quiz button tapped")
    }
}
