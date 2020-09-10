//
//  POCApiClient.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class POCApiClient {
    
    var apiResource: APIResource! = nil
    let decoder = JSONDecoder()
    
    private func sendRequest<T: Decodable>(completion: APICompletion<T>?) {
        
        guard let url = URL(string: apiResource.urlString) else {
            Utils.displayAlert(message: StringConstants.NetworkConnectionIssue, view: nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.apiResource.method.rawValue
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { data, response, error in
            let result: DataResult<T>
            
            do {
                if data != nil {
                    let parseResult: APIResponse<T> = try ParserHelper.parseJsonDataFromFile(data: data, error: error, responseData: response)
                    
                    result = DataResult.success(parseResult)
                    DispatchQueue.main.async {
                        completion?(result)
                    }
                }
            } catch {
            }
        }
        task.resume()
        
    }
}

//MARK:- Protocol to wrap API client class
extension POCApiClient: POCApiClientProtocol {
  
    func fetchDashboardInformation<T: Decodable>(url: String?, handler: @escaping ((DataResult<T>) -> Void)) {
        guard let url = url else {
            handler(DataResult.failure(APIError.invalidRequest))
            return
        }
        
        let method = RequestMethod.get
        let resource = APIResource(URLString: url, method: method)
        self.apiResource = resource
        
        return self.sendRequest(completion: handler.self)
    }
    
    
}
