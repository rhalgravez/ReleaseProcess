//
//  AXIError.swift
//  AxosCodeChallenge
//
//  Created by Roberto Halgravez on 5/27/20.
//  Copyright © 2020 Roberto Halgravez. All rights reserved.
//

import Foundation

enum AXIError: String, Error {
    case invalidData = "Invalid API call. Please retry or visit the documentation."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidURL = "There was a problem creating the URL."
    case unableToComplete = "Unable to complete your request. Plese check your internet connection."
    
}
