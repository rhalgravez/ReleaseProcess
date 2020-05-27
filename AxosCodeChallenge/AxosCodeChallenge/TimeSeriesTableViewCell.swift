//
//  TimeSeriesTableViewCell.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class TimeSeriesTableViewCell: UITableViewCell {
    
    static let reuseID = "TimeSeriesCell"
    
    let borderView = UIView()
    
    let closePriceTitleLabel = AXILabel(fontSize: 18, color: AXIColor.blue)
    let closePriceValueLabel = AXILabel(fontSize: 18, color: AXIColor.grayLabel)
    
    let dateLabel = AXILabel(fontSize: 14, color:  AXIColor.grayLabel)
    
    let volumeTitleLabel = AXILabel(fontSize: 18, color: AXIColor.blue)
    let volumeValueLabel = AXILabel(fontSize: 18, color: AXIColor.grayLabel)
    
    let priceChangeTitleLabel = AXILabel(fontSize: 14, color: AXIColor.blue)
    let priceChangeValueLabel = AXILabel(fontSize: 14, color: AXIColor.grayLabel)
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubviewsToContentView()
        configureBorderView()
        configureClosePriceLabeles()
        configureDateLabel()
        configureVolumeLabeles()
        configureChangePriceLabeles()
    }
    
    private func addSubviewsToContentView() {
        contentView.addSubview(borderView)
        borderView.addSubview(closePriceTitleLabel)
        borderView.addSubview(closePriceValueLabel)
        borderView.addSubview(dateLabel)
        borderView.addSubview(volumeTitleLabel)
        borderView.addSubview(volumeValueLabel)
        borderView.addSubview(priceChangeTitleLabel)
        borderView.addSubview(priceChangeValueLabel)
    }
    
    private func configureBorderView() {
        borderView.translatesAutoresizingMaskIntoConstraints = false
        borderView.layer.borderColor = UIColor(red: 0.83, green: 0.83, blue: 0.83, alpha: 1.00).cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 5
        borderView.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            borderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    private func configureClosePriceLabeles() {
        NSLayoutConstraint.activate([
            closePriceTitleLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 16),
            closePriceTitleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            closePriceTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            closePriceValueLabel.centerYAnchor.constraint(equalTo: closePriceTitleLabel.centerYAnchor),
            closePriceValueLabel.leadingAnchor.constraint(equalTo: closePriceTitleLabel.trailingAnchor, constant: 8),
            closePriceTitleLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    private func configureDateLabel() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: closePriceTitleLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -8),
        ])
    }
    
    private func configureVolumeLabeles() {
        NSLayoutConstraint.activate([
            volumeTitleLabel.topAnchor.constraint(equalTo: closePriceTitleLabel.bottomAnchor, constant: 16),
            volumeTitleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            volumeTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            volumeValueLabel.topAnchor.constraint(equalTo: volumeTitleLabel.topAnchor),
            volumeValueLabel.leadingAnchor.constraint(equalTo: closePriceValueLabel.leadingAnchor),
            volumeValueLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
    
    private func configureChangePriceLabeles() {
        NSLayoutConstraint.activate([
            priceChangeTitleLabel.topAnchor.constraint(equalTo: volumeTitleLabel.bottomAnchor, constant: 24),
            priceChangeTitleLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 8),
            priceChangeTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            priceChangeValueLabel.topAnchor.constraint(equalTo: priceChangeTitleLabel.topAnchor),
            priceChangeValueLabel.leadingAnchor.constraint(equalTo: priceChangeTitleLabel.trailingAnchor, constant: 8),
            priceChangeValueLabel.heightAnchor.constraint(equalToConstant: 18),
        ])
    }
}
