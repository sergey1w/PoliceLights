//
//  SirenFrame+CoreDataProperties.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//
//

import Foundation
import CoreData


extension SirenFrame {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SirenFrame> {
        return NSFetchRequest<SirenFrame>(entityName: "SirenFrame")
    }

    @NSManaged public var sirenOne: String?
    @NSManaged public var sirenFour: String?
    @NSManaged public var sirenThree: String?
    @NSManaged public var sirenTwo: String?

}

extension SirenFrame : Identifiable {

}
