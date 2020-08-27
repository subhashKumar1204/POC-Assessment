//
//  DashboardViewModel.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    weak var dataSource : GenericDataSource<AboutCanada>?
    var onErrorHandling : ((APIError?) -> Void)?
    var title : String?
    
    init(dataSource : GenericDataSource<AboutCanada>?) {
        self.dataSource = dataSource
    }
    
    //RequestService to fetch dashboard data
    func fetchDashboardData()  {
        Loader.showLoader()
        ServiceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { result in
            switch result {
            case let .success(response):
                self.title = response.data?.title ?? ""
                self.dataSource?.data.value = (response.data?.rows)!
                Loader.dismissLoader()

            case .failure:
                self.onErrorHandling?(APIError.invalidResponse)
                break
            }
        }
    }
    
    
}
