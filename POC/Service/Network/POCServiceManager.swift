//
//  POCServiceManager.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class POCServiceManager {
    
    class func fetchDashboardInformation(url: String?, handler: (APICompletion<CanadaInfomation>)? = nil) {
        RequestService.getRequest(url: url , handler: handler)
    }
}
