//
//  SirenFrame.swift
//  PoliceLights
//
//  Created by sergey on 03.03.2024.
//

import UIKit

struct SirenFrame {
    let sirenOne: Siren?
    let sirenTwo: Siren?
    let sirenThree: Siren?
    let sirenFour: Siren?
    
    init(sirenOne: Siren? = nil, sirenTwo: Siren? = nil, sirenThree: Siren? = nil, sirenFour: Siren? = nil) {
        self.sirenOne = sirenOne
        self.sirenTwo = sirenTwo
        self.sirenThree = sirenThree
        self.sirenFour = sirenFour
    }
    
    var sirens: [Siren?] {
        [sirenOne, sirenTwo, sirenThree, sirenFour]
    }
    
    static let empty = SirenFrame()
}

enum Siren: String {
    case gray
    case pink
    case red
    case violet
    case orange
    case green
    case lightBlue
    case blue
    
    var image: UIImage {
        let resource = ImageResource(name: "Lights/\(rawValue.capitalized)", bundle: .main)
        return .init(resource: resource)
    }
}

let redBlue = SirenFrame(
    sirenOne: .red,
    sirenTwo: nil,
    sirenThree: nil,
    sirenFour: .blue
)

let blueRed = SirenFrame(
    sirenOne: nil,
    sirenTwo: .red,
    sirenThree: .blue,
    sirenFour: nil
)

let pocket = SirenFrame(
    sirenOne: .orange,
    sirenTwo: .pink,
    sirenThree: .gray,
    sirenFour: .green
)

let empty = SirenFrame(
    sirenOne: nil,
    sirenTwo: nil,
    sirenThree: nil,
    sirenFour: nil
)


let mockFrames: [SirenFrame] = [
    redBlue,
    empty,
    blueRed,
//    pocket
]
