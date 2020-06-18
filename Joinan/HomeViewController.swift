//
//  HomeViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    //MARK: -  PROPERTIES
    let signOutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        print("Home view controller")
        
        setupSignOutButton()
    }
    
    //MARK: - SETUP UI
    func setupSignOutButton() {
        view.addSubview(signOutButton)
        
        signOutButton.setTitle("Sign Out", for: .normal)
        signOutButton.setTitleColor(.white, for: .normal)
        signOutButton.backgroundColor = .red
        
        signOutButton.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        setSignOutButtonConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setSignOutButtonConstraints() {
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    //MARK: - ACTIONS
    @objc func signOutButtonTapped() {
        print("sign out button tapped")
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            
            let landingPageViewController = LandingPageViewController()
            let navigationController = UINavigationController(rootViewController: landingPageViewController)
            
            //self.navigationController?.present(navigationController, animated: true, completion: nil)
            
            self.navigationController?.setViewControllers([landingPageViewController], animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }

}
