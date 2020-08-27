//
//  AppDelegate.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DashboardViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}

