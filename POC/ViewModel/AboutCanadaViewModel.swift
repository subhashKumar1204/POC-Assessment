//
//  AboutCanadaViewModel.swift
//  POC
//
//  Created by Subhash Kumar on 28/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

struct AboutCanadaViewModel {
    
    let title: String
    let description: String
    let imageUrl: String
    
    //Inject values using Dependency Injection
    init(canadaInfo : AboutCanada) {
        self.title = canadaInfo.title ?? ""
        self.description = canadaInfo.description ?? ""
        self.imageUrl = canadaInfo.imageUrl ?? ""
    }
    
}
