//
//  TimeSeriesViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class TimeSeriesViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(TimeSeriesTableViewCell.self, forCellReuseIdentifier: TimeSeriesTableViewCell.reuseID)
        tableView.rowHeight = 136
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeSeriesTableViewCell.reuseID, for: indexPath) as! TimeSeriesTableViewCell
        cell.closePriceTitleLabel.text = "Close Price:"
        cell.closePriceValueLabel.text = "$ 430.26"
        cell.dateLabel.text = "2019-12-31"
        cell.volumeTitleLabel.text = "Volume:"
        cell.volumeValueLabel.text = "999999999"
        cell.priceChangeTitleLabel.text = "Percentage Change:"
        cell.priceChangeValueLabel.text = "$ -12.20"
        return cell
    }

}
