
//
//  AnimationManager.swift
//  IOSDevelopment4
//
//  Created by MERT MUTLU on 29.01.2024.
//

import Foundation
import UIKit

protocol IAnimationManager{
    func showAnimation(_ type:AnimationManager.AnimationType, view:UIView)
    func removeAnimation(_ type:AnimationManager.AnimationType, view: UIView)
}

class AnimationManager : IAnimationManager{
    
    enum AnimationType{
        case popup
    }
    
    private static var AnimationManagerInstance: IAnimationManager?
    
    public class func shared() -> IAnimationManager {
        if AnimationManagerInstance == nil {
            AnimationManagerInstance = AnimationManager()
        }
        return AnimationManagerInstance!
    }
    
    
    func showAnimation(_ type:AnimationManager.AnimationType, view: UIView) {
        switch type {
        case .popup:
            view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            view.alpha = 0.0
            UIView.animate(withDuration: 0.25, animations: {
                view.alpha = 1.0
                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            })
            break
        }
    }
    
    func removeAnimation(_ type:AnimationManager.AnimationType, view: UIView){
        switch type {
        case .popup:
            UIView.animate(withDuration: 0.25, animations: {
                view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                view.alpha = 0.0
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    view.removeFromSuperview()
                }
            })
            break
        }
    }
}
