//
//  ProductListViewController.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 19/06/25.
//

import UIKit

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    
    private var productsArray : [ProductModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.productsTableView.reloadData()
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
    private var productViewModel : ProductViewModel = ProductViewModel()
    private var activityIndicatorView : UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationController()
        
        activityIndicatorView.startAnimating()
        productViewModel.fetchProducts(urlString: "https://api.restful-api.dev/objects") { [weak self] responseData in
            self?.productsArray = responseData
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupStyles()
        setupTableView()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.view.addSubview(activityIndicatorView)
    }
    
    func setupNavigationController() {
        navigationItem.title = "Products"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupStyles() {
        view.backgroundColor = UIColor.systemBackground
        productsTableView.backgroundColor = UIColor.systemBackground
        activityIndicatorView.tintColor = .label
    }
    
    func setupTableView() {
        productsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func setupConstraints() {
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commonCell = productsTableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        commonCell.textLabel?.text = productsArray[indexPath.row].name ?? "Not Available"
        return commonCell
    }
}
