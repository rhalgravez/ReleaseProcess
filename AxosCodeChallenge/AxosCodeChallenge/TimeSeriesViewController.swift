//
//  TimeSeriesViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/26/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit



class TimeSeriesViewController: UITableViewController {
    
    let symbol: String
    var series: [TimeSerie]
    
    init(series array:[TimeSerie], forSymbol: String) {
        self.series = array
        self.symbol = forSymbol
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = symbol
        
        let chartButton = UIBarButtonItem(image: UIImage(systemName: "chart.bar.fill"), style: .plain, target: self, action: #selector(showChart))
        navigationItem.rightBarButtonItem = chartButton
        
        view.backgroundColor = .white
        tableView.register(TimeSeriesTableViewCell.self, forCellReuseIdentifier: TimeSeriesTableViewCell.reuseID)
        tableView.rowHeight = 136
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    @objc private func showChart() {
        let chartViewController = ChartViewController(timeSeries: series)
        let navigationController = UINavigationController(rootViewController: chartViewController)
        navigationController.navigationBar.barTintColor = UIColor(red: 0.27, green: 0.35, blue: 0.41, alpha: 1.00)
        present(navigationController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return series.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TimeSeriesTableViewCell.reuseID, for: indexPath) as! TimeSeriesTableViewCell
        
        let currentTimeSerie = series[indexPath.row]
        
        var previousTimeSerie: TimeSerie? = nil
        if indexPath.row != series.count - 1 {
            previousTimeSerie = series[indexPath.row + 1]
        }
        cell.set(timeSerie: currentTimeSerie)
        cell.calculatePriceChange(currentSerie: currentTimeSerie, previousSerie: previousTimeSerie)
        
        return cell
    }

}
