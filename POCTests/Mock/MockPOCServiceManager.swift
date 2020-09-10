//
//  MockPOCServiceManager.swift
//  POCTests
//
//  Created by Subhash Kumar on 10/09/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import XCTest
@testable import POC

class MockPOCServiceManager {
    
    var shouldReturnError = false
    var fetchDashboardInformation = false
    
}

extension MockPOCServiceManager: POCServiceManagerProtocol {
    
    func fetchDashboardInformation(url: String?, handler: @escaping ((DataResult<CanadaInfomation>) -> Void)) {
        fetchDashboardInformation = true
        if shouldReturnError {
            handler(DataResult.failure(APIError.invalidURL))
        }else{
            MockPOCApiClient().fetchDashboardInformation(url: url, handler: handler)
        }
    }
    
}

