//
//  KelasSayaViewController.swift
//  Joinan
//
//  Created by Iskandar Herputra Wahidiyat on 18/06/20.
//  Copyright © 2020 Iskandar Herputra Wahidiyat. All rights reserved.
//

import UIKit

class KelasSayaViewController: UIViewController {

    //MARK: - PROPERTIES
    let searchBar = UISearchBar()
    let kelasSayaTableView = UITableView()
    let stackView = UIStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Kelas Saya"
        view.backgroundColor = .yellow
        
        setupSearchBar()
        setupKelasSayaTableView()
        setupStackView()
    }
    
    //MARK: - SETUP UI
    func setupSearchBar() {
        searchBar.barStyle = .default
        searchBar.placeholder = "Cari kelas yang sudah anda ambil"
        searchBar.setShowsCancelButton(true, animated: true)
        
        searchBar.delegate = self
    }
    
    func setupKelasSayaTableView() {
        kelasSayaTableView.dataSource = self
        kelasSayaTableView.delegate = self
    }
    
    func setupStackView() {
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(kelasSayaTableView)
        
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

extension KelasSayaViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension KelasSayaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "KelasSayaCell")
        
        cell.textLabel?.text = "Nama course"
        cell.detailTextLabel?.text = "Nama pengajar"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pelajaranDetailEnrolledViewController = PelajaranDetailEnrolledViewController()
        self.navigationController?.pushViewController(pelajaranDetailEnrolledViewController, animated: true)
    }
}
