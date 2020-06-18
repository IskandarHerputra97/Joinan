//
//  PelajaranViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class PelajaranViewController: UIViewController {

    //MARK: - PROPERTIES
    let searchBar = UISearchBar()
    let pelajaranTableView = UITableView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Pelajaran"
        view.backgroundColor = .red
        
        setupSearchBar()
        setupPelajaranTableView()
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupSearchBar() {
        searchBar.barStyle = .default
        searchBar.placeholder = "Cari pelajaran di sini"
        searchBar.setShowsCancelButton(true, animated: true)
        
        searchBar.delegate = self
    }
    
    func setupPelajaranTableView() {
        pelajaranTableView.dataSource = self
        pelajaranTableView.delegate = self
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(pelajaranTableView)
        
        setStackViewConstraints()
    }
    
    //MARK: - SET CONSTRAINTS
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    //MARK: - ACTIONS

}

extension PelajaranViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension PelajaranViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "PelajaranCell")
        
        cell.textLabel?.text = "Nama course"
        cell.detailTextLabel?.text = "Nama pengajar"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pelajaranDetailNotEnrolledViewController = PelajaranDetailNotEnrolledViewController()
        
        
    self.navigationController?.pushViewController(pelajaranDetailNotEnrolledViewController, animated: true)
        
        
        
        
    }
}
