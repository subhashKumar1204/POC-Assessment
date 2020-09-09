//
//  BaseViewController.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.appBackgroundWhiteColor
        setUpNavigation()
    }
  
    //setting up the Navigation bar color
    func setUpNavigation() {
        self.navigationController?.navigationBar.barTintColor = AppColor.NavigationColors.navigationBarColors
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:AppColor.NavigationColors.navigationBarTitleColors]
    }
    
    
}
