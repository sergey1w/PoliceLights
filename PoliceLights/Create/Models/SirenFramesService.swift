//
//  SirenFramesService.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//

import Foundation

//final class SirenFramesService {
//    private init() {}
//    
//    static let shared = SirenFramesService()
//    
//    var frames: [SirenFrame] = []
//    var currentFrame: SirenFrame? {
//        get {
//            guard !frames.isEmpty else { return nil }
//            return frames[currentIndex]
//        }
//        set {
//            guard currentIndex < frames.count else { return }
//            frames[currentIndex] = newValue ?? .init()
//        }
//    }
//    var currentIndex: Int = 0
//    
//    
//    func setFirst() {
//        guard !frames.isEmpty else { return }
//        currentFrame = frames.first ?? currentFrame
//        currentIndex = 0
//    }
//    
//    func setLast() {
//        guard !frames.isEmpty else { return }
//        currentFrame = frames.last ?? currentFrame
//        currentIndex = frames.count - 1
//    }
//    
//    func setNext() {
//        guard currentIndex + 1 < frames.endIndex else { return }
//        currentFrame = frames[currentIndex + 1]
//        currentIndex += 1
//    }
//    
//    func setPrevious() {
//        guard currentIndex - 1 >= frames.startIndex else { return }
//        currentFrame = frames[currentIndex - 1]
//        currentIndex -= 1
//    }
//}
