//
//  AppUtils.swift
//  WunderDemo
//
//  Created by Puneet Mahali on 16.08.20.
//  Copyright © 2020 Puneet Mahali. All rights reserved.
//

import Localize_Swift

class AppUtils {
 
    public static func localizedString(forKey key: String) -> String {
        Localize.setCurrentLanguage("en")
        let resutl = key.localized(using: "Localization", in: .main)
        return resutl;
    }
    
    public static func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    public static func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
