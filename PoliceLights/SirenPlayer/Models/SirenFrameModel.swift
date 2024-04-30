//
//  SirenFrame.swift
//  PoliceLights
//
//  Created by sergey on 03.03.2024.
//

import UIKit

struct SirenFrameModel {
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
    
    subscript(index: Int) -> Siren? {
        get {
            switch index {
            case 0: sirenOne
            case 1: sirenTwo
            case 2: sirenThree
            case 3: sirenFour
            default: nil
            }
        }
        set {
            func getSiren(_ i: Int) -> Siren? { i == index ? newValue : self[i] }
            self = Self(
                sirenOne: getSiren(0),
                sirenTwo: getSiren(1),
                sirenThree: getSiren(2),
                sirenFour: getSiren(3)
            )
        }
    }
}

enum Siren: String, CaseIterable {
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

extension Siren: HashFindable {}

extension SirenFrameModel: Decodable {}
extension Siren: Decodable {}

let redBlue = SirenFrameModel(
    sirenOne: .red,
    sirenTwo: nil,
    sirenThree: nil,
    sirenFour: .blue
)

let blueRed = SirenFrameModel(
    sirenOne: nil,
    sirenTwo: .red,
    sirenThree: .blue,
    sirenFour: nil
)

let pocket = SirenFrameModel(
    sirenOne: .orange,
    sirenTwo: .pink,
    sirenThree: .gray,
    sirenFour: .green
)

let empty = SirenFrameModel(
    sirenOne: nil,
    sirenTwo: nil,
    sirenThree: nil,
    sirenFour: nil
)


let mockFrames: [SirenFrameModel] = [
    redBlue,
    empty,
    blueRed,
//    pocket
]

/*
 
 {
     switch index {
     case 0:
         self = .init(
             sirenOne: newValue,
             sirenTwo: self.sirenTwo,
             sirenThree: self.sirenThree,
             sirenFour: self.sirenFour
         )
     case 1:
         self = .init(
             sirenOne: self.sirenOne,
             sirenTwo: newValue,
             sirenThree: self.sirenThree,
             sirenFour: self.sirenFour
         )
     case 2:
         self = .init(
             sirenOne: self.sirenOne,
             sirenTwo: self.sirenTwo,
             sirenThree: newValue,
             sirenFour: self.sirenFour
         )
     case 3:
         self = .init(
             sirenOne: self.sirenOne,
             sirenTwo: self.sirenTwo,
             sirenThree: self.sirenThree,
             sirenFour: newValue
         )
     default: break
     }
 }
 */
