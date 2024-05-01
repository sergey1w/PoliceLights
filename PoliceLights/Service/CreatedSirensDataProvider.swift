//
//  CreatedSirensDataProvider.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation

protocol CreatedSirensDataProvider {
    func getSirens() -> [SirenModel]
}

final class CreatedSirensService: CreatedSirensDataProvider {
    func getSirens() -> [SirenModel] {
        let fetchRequest = CreatedSiren.fetchRequest()
        do {
            let fetchList = try CoreDataManager.shared.mainContext.fetch(fetchRequest)
            return fetchList.map { SirenModel.mapFromEntity($0) }
        } catch {
            return []
        }
    }
}
