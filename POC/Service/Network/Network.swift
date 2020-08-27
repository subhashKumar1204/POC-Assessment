//
//  Network.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class Network {
    let apiResource: APIResource!
    let decoder = JSONDecoder()
    
    init(resource: APIResource?) {
        self.apiResource = resource
    }
    
    func sendRequest<T: Decodable>(completion: APICompletion<T>?)
    {
        let url = URL(string: apiResource.urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = self.apiResource.method.rawValue
        
        if let reachability = Reachability(), !reachability.isReachable {
            request.cachePolicy = .returnCacheDataDontLoad
        }
        
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
