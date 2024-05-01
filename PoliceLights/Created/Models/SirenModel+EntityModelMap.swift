//
//  SirenModel+EntityModelMap.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation
import CoreData

extension SirenModel: EntityModelMapProtocol {
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> CreatedSiren {
        let siren = CreatedSiren(context: context)
        siren.frequency = Int16(self.frequency)
        siren.sound = self.sound?.rawValue
        siren.name = UUID().uuidString
        siren.frames = NSOrderedSet(array: self.frames.map { $0.mapToEntityInContext(context) })
        return siren
    }
    
    static func mapFromEntity(_ entity: CreatedSiren) -> SirenModel {
        let frames = (entity.frames?.array as? [SirenFrame])?.map {
            SirenFrameModel.mapFromEntity($0)
        }
        return SirenModel(
            frames: frames ?? [],
            frequency: Int(entity.frequency),
            sound: SirenSound(rawValue: entity.sound ?? ""),
            name: UUID().uuidString
        )
    }
    
    typealias EntityType = CreatedSiren
 
}
