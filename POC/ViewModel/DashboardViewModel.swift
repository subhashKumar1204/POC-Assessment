//
//  DashboardViewModel.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

class DashboardViewModel {
    
    weak var dataSource : GenericDataSource<AboutCanadaViewModel>?
    var onErrorHandling : ((APIError?) -> Void)?
    var title : String?
    
    init(dataSource : GenericDataSource<AboutCanadaViewModel>?) {
        self.dataSource = dataSource
    }
    
    //Request Service to fetch dashboard data
    func fetchDashboardData(view : UIView)  {
        
        Utils().showHUD(progressLabel: StringConstants.Loading, view: view)
        let serviceManager = POCServiceManager()
        serviceManager.fetchDashboardInformation(url: ServerEndpoints.shared.DashboardFileEndPoint) { [weak self] result in
            
            switch result {
            case let .success(response):
                self?.title = response.data?.title ?? ""
                if let informations = (response.data?.rows) {
                    self?.dataSource?.data.value  = informations.map({return AboutCanadaViewModel(canadaInfo: $0)})
                }
                else{
                    self?.dataSource?.data.value = []
                }
                Utils().dismissHUD(isAnimated: true, view: view)
            
            case .failure:
                Utils().dismissHUD(isAnimated: true, view: view)
                self?.onErrorHandling?(APIError.invalidResponse)
                break
            }
        }
    }
    
    
}
