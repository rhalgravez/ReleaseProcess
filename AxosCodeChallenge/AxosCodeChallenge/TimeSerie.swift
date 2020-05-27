//
//  TimeSerie.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/27/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import Foundation

class TimeSerie {
    let date: String
    let closePrice: Decimal
    let volume: Int
    var priceChange: Decimal?
    
    init?(date: String, dictionary: [String: Any]) {
        self.date = date
        guard let closePriceString =  dictionary["4. close"] as? String else { return nil }
        guard let closePrice = Double(closePriceString) else { return nil }
        self.closePrice = Decimal(closePrice)
        guard let volumeString =  dictionary["5. volume"] as? String else { return nil }
        guard let volume = Int(volumeString) else { return nil }
        self.volume = volume
    }
    
    func closePriceTextualValue() -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 4
        numberFormatter.maximumFractionDigits = 4
        let locale = Locale(identifier: "en_US")
        numberFormatter.locale = locale
        let closePriceString = numberFormatter.string(from: NSDecimalNumber(decimal: closePrice)) ?? "#####"
        return "$ \(closePriceString)"
    }
}

extension TimeSerie {
    static func timeSeriesArray(from dictionary: [String: Any]) -> [TimeSerie] {
        guard let seriesDates =  dictionary["Time Series (Daily)"] as? [String: [String: Any]] else { return [TimeSerie]() }
        
        var timeSeries = [TimeSerie]()
        
        for item in seriesDates {
            if let timeSerie = TimeSerie(date: item.key, dictionary: item.value) {
                timeSeries.append(timeSerie)
            }
        }
        
        timeSeries = timeSeries.sorted(by: { $0.date > $1.date })
        return timeSeries
    }
}
