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

enum SirenSound {
    case police
    case firetruck
    case ambulance
    
    var audioURL: URL? {
        switch self {
        case .police:
            return Bundle.main.url(forResource: "siren1", withExtension: "waw")
        case .firetruck:
            return Bundle.main.url(forResource: "siren1", withExtension: "waw")
        case .ambulance:
            return Bundle.main.url(forResource: "siren1", withExtension: "waw")
        }
    }
}


