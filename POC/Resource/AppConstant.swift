//
//  AppConstant.swift
//  POC
//
//  Created by SUBHASH KUMAR on 27/08/20.
//  Copyright © 2020 Subhash. All rights reserved.
//

import Foundation
import UIKit

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case iPhone
    case iPad
}

public typealias JSONDictionary = [String: Any]
public typealias APICompletion<D: Decodable> = ((DataResult<D>) -> Void)

// Line capability for labels
let numberOfLinesCapability = 0
// Image Dimesion for profile imageview
let imageDimesion = 70
let CircledImage = imageDimesion/2
let timeoutForApi = 20.0


//MARK:- AppFonts
struct AppFonts {
    
    static func appTitleFont() -> UIFont {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont.boldSystemFont(ofSize: 22)
        }else{
            return UIFont.boldSystemFont(ofSize: 18)
        }
    }
    
    static func appSubTitleFont() -> UIFont {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return UIFont.boldSystemFont(ofSize: 18)
        }else{
            return UIFont.boldSystemFont(ofSize: 14)
        }
    }
}

//MARK:- Color Constant
struct AppColor {
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.6)
    }
    
    static let appThemeColor =  UIColor(red: 168/255, green: 78/255, blue: 84/255, alpha: Alphas.Opaque)
    static let appBackgroundWhiteColor =  UIColor.white
    
    //Title and SubTitle Color
    struct TextColors {
        static let title = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: Alphas.Opaque)
        static let subTitle = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: Alphas.SemiOpaque)
    }
    
    struct NavigationColors{
        static let  navigationBarColors = appThemeColor
        static let navigationBarTitleColors = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: Alphas.Opaque)
    }
    
}

