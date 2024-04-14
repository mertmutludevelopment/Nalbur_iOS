//
//  UIFontExtension.swift
//  Nalbur
//
//  Created by MERT MUTLU on 20.02.2024.
//

import Foundation
import UIKit

public extension UIFont{
    
    
    static func bold(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func black(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Black", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func light(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func medium(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func regular(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func thin(size : CGFloat = 17.0) -> UIFont{
        return UIFont(name: "Roboto-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    
    
    
}
