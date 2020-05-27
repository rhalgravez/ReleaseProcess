//
//  ChartViewController.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/27/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import UIKit
import Charts

extension String {
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-dd"
//        dateFormatter.locale        = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone      = TimeZone(abbreviation: "EST")
        
        return dateFormatter.date(from: self)
    }
}

class DateValueFormatter: NSObject, IAxisValueFormatter {
    private let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}

class ChartViewController: UIViewController{

    var chartDataEntries: [ChartDataEntry]
    
    lazy var lineChartView: LineChartView = {
        let chartView = LineChartView()
        chartView.backgroundColor = .systemRed
        return chartView
    }()
    
    
    init(timeSeries: [TimeSerie]) {
        self.chartDataEntries = ChartViewController.convertToChartEntries(timeSeries: timeSeries)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        configure()
    }
    
    private static func convertToChartEntries(timeSeries:[TimeSerie]) -> [ChartDataEntry] {
        var chartEntries = [ChartDataEntry]()
        for timeSerie in timeSeries {
            let date = timeSerie.date.convertToDate()
            let dateInSeconds = Int(date!.timeIntervalSince1970)
            let chartEntry = ChartDataEntry(x: Double(dateInSeconds), y: (timeSerie.closePrice as NSDecimalNumber).doubleValue)
            chartEntries.append(chartEntry)
        }
        return chartEntries
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    private func configure() {
        view.addSubview(lineChartView)
        
        lineChartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lineChartView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            lineChartView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            lineChartView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            lineChartView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        // Chart is not working :'(
//        let set = LineChartDataSet(entries: chartDataEntries)
//        let data = LineChartData(dataSet: set)
//        lineChartView.data = data
//        lineChartView.xAxis.valueFormatter = DateValueFormatter()
//        lineChartView.xAxis.granularity = 3600
        
    }
    

}
