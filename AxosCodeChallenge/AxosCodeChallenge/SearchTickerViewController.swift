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
    private let symbolTextField = AXITextField()
    private let searchButton = AXIButton(title: "Show global equity")
    private let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        configureLogoImageView()
        configureSymbolTextField()
        configureSearchButton()
    }
    
    private func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "axosinvest-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 195),
            logoImageView.widthAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    private func configureSymbolTextField() {
        view.addSubview(symbolTextField)
        symbolTextField.delegate = self
        
        NSLayoutConstraint.activate([
            symbolTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0),
            symbolTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            symbolTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            symbolTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    private func configureSearchButton() {
        view.addSubview(searchButton)
        searchButton.addTarget(self, action: #selector(searchButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            searchButton.topAnchor.constraint(equalTo: symbolTextField.bottomAnchor, constant: 16),
            searchButton.leadingAnchor.constraint(equalTo:
                view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func searchButtonAction() {
        guard let symbol = symbolTextField.text else { return }
        
        NetworkManager.shared.getTimeSeriesDaily(for: symbol) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let series):
                DispatchQueue.main.async {
                    let timeSeriesVC = TimeSeriesViewController(series: series, forSymbol: symbol)
                    self.navigationController?.pushViewController(timeSeriesVC, animated: true)
                }
            case .failure(let error):
                print(error.rawValue)
            }
            
        }
        
    }
}

extension SearchTickerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchButtonAction()
        return true
    }
}

