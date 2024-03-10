//
//  SirenModel.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import Foundation

struct SirenModel {
    let frames: [SirenFrame]
    let frequency: Double
    let sound: SirenSound
}

enum SirenSound: String, CaseIterable {
    case police
    case firetruck
    case ambulance
    case sirenFour
    case sirenFive
    
    var audioURL: URL? {
        switch self {
        case .police:
            return Bundle.main.url(forResource: "siren1", withExtension: "waw")
        case .firetruck:
            return Bundle.main.url(forResource: "siren2", withExtension: "waw")
        case .ambulance:
            return Bundle.main.url(forResource: "siren3", withExtension: "waw")
        case .sirenFour:
            return Bundle.main.url(forResource: "siren4", withExtension: "waw")
        case .sirenFive:
            return Bundle.main.url(forResource: "siren5", withExtension: "waw")
        }
    }
}

extension SirenModel: Decodable {}
extension SirenSound: Decodable {}

