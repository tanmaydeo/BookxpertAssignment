//
//  ProductListViewController.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 19/06/25.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        setupTableView()
    }
    
    func setupNavigationController() {
        navigationItem.title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupStyles() {
        view.backgroundColor = UIColor.systemBackground
        productsTableView.backgroundColor = UIColor.systemBackground
    }
    
    func setupTableView() {
        productsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commonCell = productsTableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        commonCell.textLabel?.text = "Hello"
        return commonCell
    }
}
