//
//  AXILabel.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/27/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class AXILabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(fontSize size: CGFloat, color: UIColor) {
        super.init(frame: .zero)
        self.font = UIFont.systemFont(ofSize: size, weight: .semibold)
        self.textColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    private func configure() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }

}
