//
//  MockPOCApiClient.swift
//  POCTests
//
//  Created by Subhash Kumar on 10/09/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import XCTest
@testable import POC

class MockPOCApiClient {
    
    var shouldReturnError = false
    var fetchDashboardInformation = false
    
    init(_ shouldReturnError : Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    convenience init() {
        self.init(false)
    }
    
    private func readLocalJSONFile<T: Decodable>(completion: APICompletion<T>?) {
        
        let result: DataResult<T>
        let error = APIError.parsingError
        if let jsonfilePath = Bundle.main.url(forResource: StringConstants.JsonFileName, withExtension: StringConstants.JsonExtension) {
            do {
                let data = try Data(contentsOf: jsonfilePath)
                let parseResult: APIResponse<T> = try ParserHelper.parseJsonDataFromFile(data: data, error: error, responseData: nil)
                
                result = DataResult.success(parseResult)
                DispatchQueue.main.async {
                    completion?(result)
                }
            } catch {
                shouldReturnError = true
            }
        }
    }

}

extension MockPOCApiClient: POCApiClientProtocol {
    
    func fetchDashboardInformation<T: Decodable>(url: String?, handler: @escaping ((DataResult<T>) -> Void)) {
        fetchDashboardInformation = true
        if shouldReturnError {
            handler(DataResult.failure(APIError.invalidRequest))
        }else{
            return self.readLocalJSONFile(completion: handler.self)
        }
    }
    
}
