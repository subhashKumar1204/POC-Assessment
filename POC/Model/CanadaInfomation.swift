//
//  CanadaInfomation.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

struct CanadaInfomation: Codable {
    
    let title: String?
    let rows: [AboutCanada]?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case rows
    }
}

