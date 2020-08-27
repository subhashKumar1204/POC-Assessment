//
//  ServerEndpoints.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class ServerEndpoints: NSObject, Codable { // checkpoint

    static let shared = ServerEndpoints()
    var DashboardFileEndPoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    
    override init() {}
    required init(from _: Decoder) throws {}

}
