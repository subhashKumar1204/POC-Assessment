//
//  ErrorResult.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

public enum APIError: Error {
    case noInternetConnection
    case sessionExpired
    case invalidRequest
    case invalidURL
    case invalidResponse
    case parsingError
    case needRetry
    
    func localizedDescription() -> String {
        switch self {
        case .noInternetConnection:
            return "Sorry we are unable to connect the server. Please check your network connection"
        case .invalidRequest:
            return "Problem with network request. Please try later"
        case .parsingError:
            return "Unable to parse the server response. Please try later"
        case .invalidURL:
                return "Problem with network request URL. Please try later"
        default:
            return "Something went wrong. Please try later"
        }
    }
    
    func localizedCode() -> Int {
        switch self {
        case .noInternetConnection:
            return 0
        case .invalidRequest:
            return 0
        case .parsingError:
            return 0
            
        default:
            return 0
        }
    }
    
}

