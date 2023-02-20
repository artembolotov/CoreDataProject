//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by artembolotov on 19.02.2023.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?

    var wrappedFirstName: String {
         firstName ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknown"
    }
}

extension Singer : Identifiable {

}
