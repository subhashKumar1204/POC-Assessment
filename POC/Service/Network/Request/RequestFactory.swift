//
//  RequestFactory.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

public enum RequestMethod: String {
    case get = "GET"
}

struct APIResource {
    
    let urlString: String
    let method: RequestMethod
    
    init(URLString url: String, method: RequestMethod = .get ) {
        self.urlString = url
        self.method = method
        
    }
}
