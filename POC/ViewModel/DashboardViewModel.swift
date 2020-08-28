//
//  DashboardViewModel.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    weak var dataSource : GenericDataSource<AboutCanadaViewModel>?
    var onErrorHandling : ((APIError?) -> Void)?
    var title : String?
    
    init(dataSource : GenericDataSource<AboutCanadaViewModel>?) {
        self.dataSource = dataSource
    }
    
    //RequestService to fetch dashboard data
    func fetchDashboardData()  {
        Loader.showLoader()
       
        POCServiceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { result in
            
            switch result {
            case let .success(response):
                self.title = response.data?.title ?? ""
                if let informations = (response.data?.rows) {
                    self.dataSource?.data.value  = informations.map({return AboutCanadaViewModel(canadaInfo: $0)})
                }
                else{
                    self.dataSource?.data.value = []
                }
                Loader.dismissLoader()

            case .failure:
                self.onErrorHandling?(APIError.invalidResponse)
                break
            }
        }
    }
    
    
}
