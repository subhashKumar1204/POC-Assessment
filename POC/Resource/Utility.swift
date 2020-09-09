//
//  Utility.swift
//  POC
//
//  Created by Subhash Kumar on 09/09/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

struct Utils {
    
    static func displayAlert(message: String, view : UIViewController?) {
        let alertController = UIAlertController(title: StringConstants.Alert, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: StringConstants.OK, style: UIAlertAction.Style.default, handler: { _ in
        }))
        
        if let parentView = view {
            parentView.present(alertController, animated: true, completion: nil)
        }
        else{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
