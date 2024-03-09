//
//  ReadySirenModel.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import Foundation

struct ReadySirenModel {
    let title: String
    let sirens: [SirenModel]
}

extension ReadySirenModel: Decodable {}
