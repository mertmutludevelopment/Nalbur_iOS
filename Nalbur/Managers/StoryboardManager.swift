///ERGİN SAHİN


import Foundation
import UIKit
//
//protocol IETSStoryboardManager{
//    func getStoryboard(_ name:ETSStoryboardManager.ETSStoryboard, useiPhoneView : Bool) -> UIStoryboard
//    func getController<T>(_ storyboard:ETSStoryboardManager.ETSStoryboard, controller:String, type: T.Type, useiPhoneView : Bool) -> T
//    func getUIView(_ viewClass: AnyClass, useiPhoneView : Bool) -> UIView
//}

class StoryboardManager  {
    
    private static let iPadSuffix = "iPad"
    
    enum Storyboard{
        case policy
        
        var name: String{
            switch self {
            case .policy: return "Policy"
            }
        }
    }
    
    private static var IDetectStoryboardInstance: StoryboardManager?
    
    public class func shared() -> StoryboardManager {
        if IDetectStoryboardInstance == nil {
            IDetectStoryboardInstance = StoryboardManager()
        }
        return IDetectStoryboardInstance!
    }
     
    private func getStoryboard(_ storyboard:Storyboard, useiPhoneView : Bool = true) -> UIStoryboard {
        
        var storyboardName = storyboard.name
        
        if(!useiPhoneView){
            switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .pad:
                storyboardName = "\(storyboard.name)\(StoryboardManager.iPadSuffix)"
            default:
                break
            }
        }
        
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    
    func getController<T>(_ storyboard:Storyboard, controller:String, type: T.Type, useiPhoneView : Bool = true) -> T{
        
        var controllerName = controller
        
        if(!useiPhoneView){
            switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .pad:
                controllerName = "\(controller)\(StoryboardManager.iPadSuffix)"
            default:
                break
            }
        }
        
        let storyboardInstance = getStoryboard(storyboard, useiPhoneView: useiPhoneView)
        
        let controllerInstance =  storyboardInstance.instantiateViewController(withIdentifier: controllerName) as! T
        
        return controllerInstance
    }

    
    
    //XIB
    func getUIView(_ viewClass: AnyObject, useiPhoneView : Bool = true) -> UIView {
        
        let bundle = Bundle(for: type(of: viewClass))
        
        var nibIdentifier = NSStringFromClass(viewClass.classForCoder).components(separatedBy: ".").last!
        
        if(!useiPhoneView){
            switch UIScreen.main.traitCollection.userInterfaceIdiom {
            case .pad:
                nibIdentifier = "\(nibIdentifier)\(StoryboardManager.iPadSuffix)"
            default:
                break
            }
        }
        
        let nib = UINib(nibName: nibIdentifier, bundle: bundle)

        let view = nib.instantiate(withOwner: viewClass, options: nil)[0] as! UIView
        
        return view
    }
    
}

