//
//  ReadySirenModel.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import Foundation

struct ReadySirenModel {
    let title: String
    let sirens: [ReadySiren]
}

extension ReadySirenModel: Decodable {}

enum SpecialSiren: String {
    case policeSolid1
    case policeSolid2
    case policeSolid3
    
    case firetruck1
    case firetruck2
}

extension SpecialSiren: Decodable {}


enum ReadySiren {
    case siren(SirenModel)
    case special(SpecialSiren)
}

extension ReadySiren: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let specialSiren = try? container.decode(SpecialSiren.self) {
            self = .special(specialSiren)
            return
        }
        if let sirenModel = try? container.decode(SirenModel.self) {
            self = .siren(sirenModel)
            return
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Could not decode ReadySiren")
    }
}
