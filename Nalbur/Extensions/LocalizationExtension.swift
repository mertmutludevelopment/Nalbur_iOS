//
//  LocalizationExtension.swift
//  Nalbur
//
//  Created by MERT MUTLU on 20.02.2024.
//

import Foundation

public extension String{
    
    var localized: String {
            let language = LanguageManager.shared().getLanguageIso().lowercased()
            let path = Bundle.main.path(forResource: language, ofType: "lproj")
            let bundle = Bundle(path: path!)
            return NSLocalizedString(self, tableName: "Localization", bundle: bundle!, value: "", comment: "")
        }
        
        func localized(_ args: [Any]) -> String {
            var localized = self.localized
            for (key,value) in args.enumerated() {
                if localized.contains("{\(key)}") {
                    localized = localized.replacingOccurrences(of: "{\(key)}", with: "\(value)")
                }
            }
            return localized
        }
    
}
