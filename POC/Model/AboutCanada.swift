//
//  AboutCanada.swift
//  POC
//
//  Created by Subhash Kumar on 28/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation

struct AboutCanada: Codable {
    
    let title: String?
    let description: String?
    let imageUrl: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageUrl = "imageHref"
    }
}
