//
//  POCApiClientProtocol.swift
//  POC
//
//  Created by Subhash Kumar on 10/09/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

//MARK:- Protocol to wrap POCApiClient
protocol POCApiClientProtocol {
    
    func fetchDashboardInformation<T: Decodable>(url: String?, handler: @escaping ((DataResult<T>) -> Void))
    
}
