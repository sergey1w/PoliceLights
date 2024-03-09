//
//  ReadySirensParser.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import Foundation

protocol ReadySirensDataProvider {
    func getSirens() -> [ReadySirenModel]
}

final class ReadySirensParser: ReadySirensDataProvider {
    private let decoder = JSONDecoder()
    
    func getSirens() -> [ReadySirenModel] {
        guard let url = Bundle.main.url(forResource: "ReadySirens", withExtension: "json") 
        else {
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try decoder.decode([ReadySirenModel].self, from: data)
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        return []
    }
}
