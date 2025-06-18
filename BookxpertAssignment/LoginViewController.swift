//
//  LoginViewController.swift
//  BookxpertAssignment
//
//  Created by Tanmay Deo on 18/06/25.
//

import UIKit
import FirebaseCore
import GoogleSignIn

class LoginViewController: UIViewController {
    
    var googleSigninButton : UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupStyles()
        setupConstraints()
    }
    
    func setupHierarchy() {
        view.addSubview(googleSigninButton)
    }
    
    func setupStyles() {
        self.view.backgroundColor = .systemBackground
        styleButton()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            googleSigninButton.heightAnchor.constraint(equalToConstant: 40),
            googleSigninButton.widthAnchor.constraint(equalToConstant: 120),
            googleSigninButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            googleSigninButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

//MARK: UIComponent Styling
extension LoginViewController {
    
    func styleButton() {
        googleSigninButton.setTitle(AppConstants.signinWithGoogleButtonTitle.rawValue, for: .normal)
        googleSigninButton.backgroundColor = UIColor.red
        googleSigninButton.translatesAutoresizingMaskIntoConstraints = false
        googleSigninButton.layer.cornerRadius = 8
        googleSigninButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        googleSigninButton.addTarget(self, action: #selector(signinWithGoogleButtonClicked), for: .touchUpInside)
    }
    
    func setupGoogleSigninConfiguration() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
    }
    
    @objc func signinWithGoogleButtonClicked() {
//        setupGoogleSigninConfiguration()
//        
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
//            guard error == nil else { return }
//        }
        
        let productsListVC = UIStoryboard(name: AppConstants.productsListViewControllerStoryboardID.rawValue, bundle: nil).instantiateViewController(identifier: AppConstants.productsListViewControllerStoryboardID.rawValue)
        self.navigationController?.pushViewController(productsListVC, animated: true)
        
    }
    
}
