//
//  SirenFrameModel+EntityModelMap.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation
import CoreData

extension SirenFrameModel: EntityModelMapProtocol {
    func mapToEntityInContext(_ context: NSManagedObjectContext) -> SirenFrame {
        let siren = SirenFrame(context: context)
        siren.sirenOne = self.sirenOne?.rawValue
        siren.sirenTwo = self.sirenTwo?.rawValue
        siren.sirenThree = self.sirenThree?.rawValue
        siren.sirenFour = self.sirenFour?.rawValue
        return siren
    }
    
    static func mapFromEntity(_ entity: SirenFrame) -> SirenFrameModel {
        SirenFrameModel(
            sirenOne: Siren(rawValue: entity.sirenOne ?? ""),
            sirenTwo: Siren(rawValue: entity.sirenTwo ?? ""),
            sirenThree: Siren(rawValue: entity.sirenThree ?? ""),
            sirenFour: Siren(rawValue: entity.sirenFour ?? "")
        )
    }
    
    typealias EntityType = SirenFrame
}
