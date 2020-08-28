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

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case iPhone // iPhone and iPod touch style UI
    case iPad   // iPad style UI (also includes macOS Catalyst)
}

struct Constants {
    
    static let imageDimesion = 70
    
    //message literals
    static let pullToRefresh = "Pull to Refresh"
    static let expectedUrlForTest = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

}

