//
//  EntityModelMapProtocol.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation
import CoreData

protocol EntityModelMapProtocol {
    associatedtype EntityType: NSManagedObject
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> EntityType
    static func mapFromEntity(_ entity: EntityType) -> Self
}
