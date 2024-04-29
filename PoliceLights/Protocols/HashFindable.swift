//
//  HashFindable.swift
//  PoliceLights
//
//  Created by sergey on 07.04.2024.
//

import Foundation

protocol HashFindable: Hashable {
    static var hashTable: [Int:Siren] { get }
}

extension HashFindable where Self: CaseIterable {
    static var hashTable: [Int:AllCases.Element] {
        Dictionary(uniqueKeysWithValues:  Self.allCases.map { element in
            (element.hashValue, element)
        })
    }
}
