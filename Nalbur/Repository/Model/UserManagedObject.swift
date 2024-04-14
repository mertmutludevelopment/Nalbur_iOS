//
//  UserManagedObject.swift
//  Nalbur
//
//  Created by MERT MUTLU on 6.02.2024.
//

import Foundation
import CoreData

class UserManagedObject: NSManagedObject {
    
    @NSManaged var name: String?
    @NSManaged var surname: String?
    @NSManaged var email: String?
    @NSManaged var password: String?
    @NSManaged var language: String?

    
}
