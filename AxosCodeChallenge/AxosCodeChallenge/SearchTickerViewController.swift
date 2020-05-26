//
//  SearchTickerViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/25/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class SearchTickerViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let searchButton = AXIButton(title: "Show global equitiy")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureLogoImageView()
        configureSearchButton()
    }
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "axosinvest-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 195),
            logoImageView.widthAnchor.constraint(equalToConstant: 380)
            
            
        ])
    }
    
    private func configureSearchButton() {
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 16),
            searchButton.leadingAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}
