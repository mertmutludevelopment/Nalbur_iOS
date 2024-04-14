//
//  BilyonerLanguageManager.swift
//  Bilyoner
//
//  Created by Ergin Şahin on 7.02.2023.
//  Copyright ©️ 2023 Bilyoner. All rights reserved.
//

import Foundation

struct LanguageModel {
    var index : Int
    var name : String
    var code : String
    var isDefault : Bool
}

class LanguageManager: NSObject {
    
    private static var LanguageManagerInstance: LanguageManager?
    public class func shared() -> LanguageManager {
        if LanguageManagerInstance == nil {
            LanguageManagerInstance = LanguageManager()
        }
        return LanguageManagerInstance!
    }
    
    func getSupportedLanguages() -> [LanguageModel]{
        var languages: [LanguageModel] = []
        let en = LanguageModel(index:1, name: "English", code: "EN", isDefault: true)
        languages.append(en)
        return languages
    }
    
    func checkCurrentLanguage() {
        var setted = false
        
        if let currentLang = Locale.current.languageCode {
            
            for language in getSupportedLanguages() {
                if (language.code != currentLang){
                    continue
                }
                
                setted = true
                self.setLanguage(languageCode: language.code)
                return
            }
        }
        
        if !setted {
            for language in getSupportedLanguages() {
                if (!language.isDefault){
                    continue
                }
                
                self.setLanguage(languageCode: language.code)
                return
            }
        }
    }
    
    func setLanguage(languageCode: String) {
            UserDefaults.standard.set(languageCode, forKey: "UserLanguage")
        }
    
        func getLanguageIso() -> String {
            
            var languageCode: String?
            
            for language in getSupportedLanguages() {
               
                if language.isDefault {
                    languageCode = language.code
                    continue
                }
                
                if let kLanguage = UserDefaults.standard.string(forKey: "UserLanguage"), !kLanguage.isEmpty {
                    if language.code != kLanguage {
                        languageCode = language.code
                        break
                    }
                }
            }
            
            return languageCode ?? ""
        }
        
        func getLocale() -> Locale {
            return Locale.init(identifier: getLanguageIso())
        }
        
    
}

