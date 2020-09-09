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
            return StringConstants.NoInternetConnection
        case .invalidRequest:
            return StringConstants.InvalidRequest
        case .parsingError:
            return StringConstants.parsingError
        case .invalidURL:
                return StringConstants.InvalidURL
        default:
            return StringConstants.defaultString
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

