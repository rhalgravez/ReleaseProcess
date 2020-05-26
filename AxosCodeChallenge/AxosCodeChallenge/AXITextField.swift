//
//  AXITextField.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class AXITextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 4
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray6.cgColor
        textColor = .systemGray
        backgroundColor = .white
        textAlignment = .center
        autocorrectionType = .no
        returnKeyType = .go
        autocapitalizationType = .allCharacters
        
        placeholder = "Enter company symbol"
    }

}
