//
//  CreatedSiren+CoreDataProperties.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
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
    @NSManaged public var frames: NSOrderedSet?

}

// MARK: Generated accessors for frames
extension CreatedSiren {

    @objc(insertObject:inFramesAtIndex:)
    @NSManaged public func insertIntoFrames(_ value: SirenFrame, at idx: Int)

    @objc(removeObjectFromFramesAtIndex:)
    @NSManaged public func removeFromFrames(at idx: Int)

    @objc(insertFrames:atIndexes:)
    @NSManaged public func insertIntoFrames(_ values: [SirenFrame], at indexes: NSIndexSet)

    @objc(removeFramesAtIndexes:)
    @NSManaged public func removeFromFrames(at indexes: NSIndexSet)

    @objc(replaceObjectInFramesAtIndex:withObject:)
    @NSManaged public func replaceFrames(at idx: Int, with value: SirenFrame)

    @objc(replaceFramesAtIndexes:withFrames:)
    @NSManaged public func replaceFrames(at indexes: NSIndexSet, with values: [SirenFrame])

    @objc(addFramesObject:)
    @NSManaged public func addToFrames(_ value: SirenFrame)

    @objc(removeFramesObject:)
    @NSManaged public func removeFromFrames(_ value: SirenFrame)

    @objc(addFrames:)
    @NSManaged public func addToFrames(_ values: NSOrderedSet)

    @objc(removeFrames:)
    @NSManaged public func removeFromFrames(_ values: NSOrderedSet)

}

extension CreatedSiren : Identifiable {

}
