//
//  Response.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

public struct APIResponse<Value> {
    let data: Value?
    let responseHeaders: [AnyHashable: Any]?
    
    init(data: Value?, responseHeaders: [AnyHashable: Any]? = nil) {
        self.data = data
        self.responseHeaders = responseHeaders
    }
}
