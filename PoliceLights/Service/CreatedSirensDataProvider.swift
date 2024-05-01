//
//  CreatedSirensDataProvider.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation
import CoreData

protocol CreatedSirensDataProvider {
    func getSirens() -> [SirenModel]
    func deleteSiren(_ name: String)
}

final class CreatedSirensService: CreatedSirensDataProvider {
    
    private init() {}
    
    private let manager = CoreDataManager.shared
    static let shared = CreatedSirensService()
    
    
    func getSirens() -> [SirenModel] {
        let fetchRequest = CreatedSiren.fetchRequest()
        do {
            let fetchList = try CoreDataManager.shared.mainContext.fetch(fetchRequest)
            return fetchList.map { SirenModel.mapFromEntity($0) }
        } catch {
            return []
        }
    }
    func deleteSiren(_ name: String) {
        let req = CreatedSiren.fetchRequest() as NSFetchRequest<NSFetchRequestResult>
        let predicate = NSPredicate(format: "name = %@", name)
        req.predicate = predicate
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: req)
        do {
            try manager.persistentContainer.persistentStoreCoordinator
                .execute(deleteRequest, with: manager.mainContext)
        } catch {
            print(error)
        }
    }
}
