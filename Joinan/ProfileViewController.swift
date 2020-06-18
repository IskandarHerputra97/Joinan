//
//  ProfileViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    //MARK: - PROPERTIES
    let profileLabel = UILabel()
    let signOutButton = UIButton()
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Profile"
        view.backgroundColor = .green
        
        setupProfileLabel()
        setupSignOutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.profileLabel.text = user.email
            }
        })
    }
    
    //MARK: - SETUP UI
    func setupProfileLabel() {
        view.addSubview(profileLabel)
        
        profileLabel.text = "User email here"
        profileLabel.numberOfLines = 0
        //profileLabel.textColor = .red
        
        setProfileLabelConstraints()
    }
    
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.backgroundColor = .red
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        setSignOutButtonConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setProfileLabelConstraints() {
        profileLabel.translatesAutoresizingMaskIntoConstraints = false
        profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setSignOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signOutButton.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func signOutButtonTapped() {
        print("sign out button tapped")
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            let landingPageViewController = LandingPageViewController()
            let navigationController = UINavigationController(rootViewController: landingPageViewController)
            
            //self.navigationController?.setViewControllers([landingPageViewController], animated: true)
            self.tabBarController?.navigationController?.pushViewController(navigationController, animated: true)
            self.tabBarController?.show(navigationController, sender: self)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
