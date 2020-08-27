//
//  Result.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation


public enum DataResult<D> {
    case success(APIResponse<D>)
    case failure(APIError)
    
    /// Gives the response if result is success. else returns nil
    public var response: APIResponse<D>? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
}

