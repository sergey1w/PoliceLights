//
//  CreatedSiren+CoreDataProperties.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//
//

import Foundation
import CoreData


extension CreatedSiren {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CreatedSiren> {
        return NSFetchRequest<CreatedSiren>(entityName: "CreatedSiren")
    }

    @NSManaged public var name: String?
    @NSManaged public var sound: String?
    @NSManaged public var frequency: Int16
    @NSManaged public var frames: NSSet?

}

// MARK: Generated accessors for frames
extension CreatedSiren {

    @objc(addFramesObject:)
    @NSManaged public func addToFrames(_ value: SirenFrame)

    @objc(removeFramesObject:)
    @NSManaged public func removeFromFrames(_ value: SirenFrame)

    @objc(addFrames:)
    @NSManaged public func addToFrames(_ values: NSSet)

    @objc(removeFrames:)
    @NSManaged public func removeFromFrames(_ values: NSSet)

}

extension CreatedSiren : Identifiable {

}
