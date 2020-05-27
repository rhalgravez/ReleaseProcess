//
//  TimeSeriesViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit

class TimeSeriesViewController: UITableViewController {

    var series: [TimeSerie]
    
    init(series array:[TimeSerie]) {
        self.series = array
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        tableView.register(TimeSeriesTableViewCell.self, forCellReuseIdentifier: TimeSeriesTableViewCell.reuseID)
        tableView.rowHeight = 136
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeSeriesTableViewCell.reuseID, for: indexPath) as! TimeSeriesTableViewCell
        
        let timeSerie = series[indexPath.row]
        
        cell.set(timeSerie: timeSerie)
        return cell
    }

}
