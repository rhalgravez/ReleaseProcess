//
//  SearchTickerViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/25/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class SearchTickerViewController: UIViewController {
    
    let searchButton = AXIButton(title: "Show global equitiy")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configureSearchButton()
    }
    
    private func configureSearchButton() {
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 132),
            searchButton.leadingAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}
