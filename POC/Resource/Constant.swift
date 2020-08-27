//
//  Constant.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

public typealias JSONDictionary = [String: Any]
public typealias APICompletion<D: Decodable> = ((DataResult<D>) -> Void)



struct Constants {
    
    static let imageDimesion = 70

    //message
    static let pullToRefresh = "Pull to Refresh"

    
}

