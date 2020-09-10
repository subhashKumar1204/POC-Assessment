//
//  POCServiceManager.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

class POCServiceManager : POCServiceManagerProtocol {
    
    func fetchDashboardInformation(url: String?, handler: @escaping ((DataResult<CanadaInfomation>) -> Void)) {
        POCApiClient().fetchDashboardInformation(url: url, handler: handler)
    }
}
