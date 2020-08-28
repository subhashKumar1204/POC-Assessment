//
//  RequestService.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

class RequestService {
    
    class func getRequest<T: Decodable>(url: String?, handler: (APICompletion<T>)? = nil) {
        request(url: url, method: .get, handler: handler)
    }
    
    class func request<T: Decodable>(url: String?, method: RequestMethod , handler: (APICompletion<T>)? = nil) {
        guard let url = url else {
            handler?(DataResult.failure(APIError.invalidRequest))
            return
        }
        
        let resource = APIResource(URLString: url, method: method)
        return POCHttpClient(resource: resource).sendRequest(completion: handler)
    }
    
}
