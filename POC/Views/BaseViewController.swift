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
        self.view.backgroundColor = .white
        setUpNavigation()
    }
  
    func setUpNavigation() {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 168/255, green: 78/255, blue: 84/255, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
    
    
}
