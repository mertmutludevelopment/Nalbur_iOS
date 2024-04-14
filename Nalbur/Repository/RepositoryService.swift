//
//  RepositoryService.swift
//  Nalbur
//
//  Created by MERT MUTLU on 6.02.2024.
//

import Foundation
import UIKit
import CoreData

class RepositoryService {
    
    static let shared = RepositoryService()
    
    private let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Read
    func signIn(email:String, password:String) -> SignInResponseModel {
        
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        let resultPredicate1 = NSPredicate(format: "email = %@ AND password = %@", email, password)
        request.predicate = resultPredicate1
        
        if let results = try! self.managedObjectContext.fetch(request) as? [UserModel] {
            
            if results.count > 0 {
                let item = results.first!
                
                return SignInResponseModel.init(result: true, user: UserModel.init(name: item.name, surname: item.surname, email: item.email, password: item.password))
                
            }
        }

        return SignInResponseModel.init(result: false, errorCode: "E2", errorMessage: "Email or Password Wrong", user: nil)
    }
    
    //Create
    func signUp(name:String, surname:String, email:String, password:String) -> SignInResponseModel{
            
        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        let resultPredicate1 = NSPredicate(format: "email = %@", email)
        request.predicate = resultPredicate1
        
        let results : NSArray = try! self.managedObjectContext.fetch(request) as NSArray
        if results.count > 0 {
            return SignInResponseModel.init(result: false, errorCode: "E1", errorMessage: "Already Sign Up", user: nil)
        }
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.managedObjectContext) as! UserManagedObject
        newItem.name = name
        newItem.surname = surname
        newItem.email = email
        newItem.password = password
        
        try! newItem.managedObjectContext?.save()
    
        return SignInResponseModel.init(result: true, user: UserModel.init(name: name, surname: surname, email: email, password: password))
    }
    
    
    
    
    
    
}
