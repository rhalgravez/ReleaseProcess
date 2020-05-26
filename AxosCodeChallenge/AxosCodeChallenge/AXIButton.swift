//
//  AXIButton.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class AXIButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 5
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        backgroundColor = UIColor(red: 0.39, green: 0.65, blue: 0.82, alpha: 1.00)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
