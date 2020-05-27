//
//  NetworkManager.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/27/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    
    
    func getTimeSeriesDaily(for symbol: String, completed: @escaping (Result<[TimeSerie], AXIError>) -> Void) {
        let endpoint = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=\(symbol)&outputsize=compact&apikey=R3Y7HU5SANY66YRE"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print("\(json)")
                    let timeSerie = TimeSerie.timeSeriesArray(from: json)
                    completed(.success(timeSerie))
                }
            }catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
        
    }
}
