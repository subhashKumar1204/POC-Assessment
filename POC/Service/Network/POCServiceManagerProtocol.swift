//
//  POCServiceManagerProtocol.swift
//  POC
//
//  Created by Subhash Kumar on 10/09/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

//MARK:- Protocol to wrap service manager
protocol POCServiceManagerProtocol {
    func fetchDashboardInformation(url: String?, handler: @escaping ((DataResult<CanadaInfomation>) -> Void))
}

