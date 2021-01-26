//
//  SavedWords+CoreDataProperties.swift
//  
//
//  Created by Lev Martens on 26/1/21.
//
//

import Foundation
import CoreData


extension SavedWords {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedWords> {
        return NSFetchRequest<SavedWords>(entityName: "SavedWords")
    }

    @NSManaged public var words: NSObject?
    @NSManaged public var a: String?

}
