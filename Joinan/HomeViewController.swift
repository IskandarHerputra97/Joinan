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
    
    let tabBar = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        print("Home view controller")
        
        setupTabBar()
    }
    
    //MARK: - SETUP UI
    func setupTabBar() {
        view.addSubview(tabBar.view)
        
        let pelajaranViewController = PelajaranViewController()
        let kelasSayaViewController = KelasSayaViewController()
        let profileViewController = ProfileViewController()
        
        let navigationController1 = UINavigationController(rootViewController: pelajaranViewController)
        let navigationController2 = UINavigationController(rootViewController: kelasSayaViewController)
        let navigationController3 = UINavigationController(rootViewController: profileViewController)
        
        let item1 = UITabBarItem(title: "Pelajaran", image: UIImage(named: "profileIcon24"), tag: 0)
        let item2 = UITabBarItem(title: "Kelas Saya", image: UIImage(named: "profileIcon24"), tag: 1)
        let item3 = UITabBarItem(title: "Profile", image: UIImage(named: "profileIcon24"), tag: 2)
        
        navigationController1.tabBarItem = item1
        navigationController2.tabBarItem = item2
        navigationController3.tabBarItem = item3
        
        tabBar.viewControllers = [navigationController1, navigationController2, navigationController3]
    }
    
    //MARK: - SET CONSTRAINTS
    
    //MARK: - ACTIONS
    

}
