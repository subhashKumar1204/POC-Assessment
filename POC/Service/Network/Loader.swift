//
//  Loader.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//


import Foundation
import SVProgressHUD


class Loader {
    
    static func showLoader() {
        SVProgressHUD.setDefaultMaskType(.none)
        SVProgressHUD.setDefaultStyle(.custom)
        SVProgressHUD.setForegroundColor(UIColor.orange)
        SVProgressHUD.setBackgroundColor(UIColor.white)
        SVProgressHUD.show()
    }
    
    static func dismissLoader() {
        SVProgressHUD.dismiss()
    }
}
