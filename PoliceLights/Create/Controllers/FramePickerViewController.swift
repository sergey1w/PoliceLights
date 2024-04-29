//
//  FramePickerViewController.swift
//  PoliceLights
//
//  Created by sergey on 22.04.2024.
//

import UIKit

final class FramePickerViewController: UIViewController {
    
    private let framePickerView = FramePickerView(frame: .zero)
    private let preview = SirensPreview()
    private let saveButton = RoundedButton()
    
    private(set) var frames: [SirenFrame] = []
    private(set) var currentIndex: Int = 0 {
        didSet {
            framePickerView.setLabels(f: currentIndex.description)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setFrame(frame: SirenFrame) {
        guard currentIndex < frames.count else { return }
        frames[currentIndex] = frame
        preview.setFrame(frame: frames[currentIndex])
    }
    
    @objc func firstFrame() {
        guard let frame = frames.first else { return }
        preview.setFrame(frame: frame)
        currentIndex = 0
    }
    @objc func prevFrame() {
        guard currentIndex - 1 >= frames.startIndex else { return }
        preview.setFrame(frame: frames[currentIndex - 1])
        currentIndex = currentIndex - 1
    }
    @objc func lastFrame() {
        guard let frame = frames.last else { return }
        preview.setFrame(frame: frame)
        currentIndex = frames.count - 1
    }
    @objc func nextFrame() {
        guard currentIndex + 1 < frames.endIndex else { return }
        preview.setFrame(frame: frames[currentIndex + 1])
        currentIndex += 1
    }
    @objc func addFrame() {
        frames.append(.init())
        currentIndex = frames.count - 1
        preview.setFrame(frame: frames[currentIndex])
    }
    
    @objc func playPreview() {
        let vc = SirenViewController(model: .init(frames: frames, frequency: 3), sound: nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    private func setup() {
        preview.isUserInteractionEnabled = false
        view.addSubview(framePickerView)
        view.addSubview(preview)
        view.addSubview(saveButton)
        setupSaveButton()
        framePickerView.snap(to: view.safeAreaLayoutGuide, [.trailing,.top])
        preview.snap(to: view.safeAreaLayoutGuide, [.leading,.bottom])
        saveButton.snap(to: view.safeAreaLayoutGuide, [.bottom,.trailing])
        saveButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        NSLayoutConstraint.snap([saveButton.leadingAnchor], [preview.trailingAnchor], constants: [16])
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setSelected()
        saveButton.setImage(.Icons.tickSquare, for: .normal)
        saveButton.tintColor = .white
        saveButton.bringSubviewToFront(saveButton.imageView ?? saveButton) // ios bug
        saveButton.setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
    }
    
    // TODO: Stackview
    /// at the top picker
    /// at the bottom buttons (play fullscreen SIrenView AND + add frame)
    /// save button at the bottom of the view
    /// current frame in the CreateController
}



/*
 //struct FrameSequence: Sequence {
 //    typealias Iterator = FrameIterator
 //
 //    func makeIterator() -> FrameIterator {
 //        FrameIterator()
 //    }
 //}
 //
 //struct FrameCollection: Collection {
 //    typealias Element = SirenFrame
 //    typealias Index = [Element].Index
 //
 //    private var frames: [SirenFrame] = []
 //
 //    var startIndex: Array<Element>.Index { frames.startIndex }
 //    var endIndex: Array<Element>.Index { frames.endIndex }
 //
 //    subscript(position: Array<Element>.Index) -> SirenFrame {
 //        get { frames[position] }
 //        set { frames[position] = newValue }
 //    }
 //
 //    func index(after i: Array<Element>.Index) -> Array<Element>.Index {
 //        frames.index(after: i)
 //    }
 //}
 //
 //extension FrameCollection: BidirectionalCollection {
 //    func index(before i: Array<Element>.Index) -> Array<Element>.Index {
 //        frames.index(before: i)
 //    }
 //}

 extension Array where Element == SirenFrame {
     func makeIterator() -> FrameIterator {
         return FrameIterator()
     }
 }

 struct FrameIterator: IteratorProtocol {
     typealias Element = SirenFrame
     typealias Index = [Element].Index
     
     private var frames: [SirenFrame] = []
     private var index: Index
     
     init() {
         self.frames = []
         self.index = frames.startIndex
     }
     
     var count: Index {
         frames.count
     }
     
     var first: SirenFrame? {
         frames.first
     }
     
     var last: SirenFrame? {
         frames.last
     }
     
     subscript(_ i: Index) -> SirenFrame {
         get { frames[i] }
         set { frames[i] = newValue }
     }
     
     mutating func next() -> SirenFrame? {
         guard !self.frames.isEmpty else { return nil }
         index = frames.index(after: index)
         if index == frames.endIndex {
             index = frames.startIndex
         }
         return frames[index]
     }
     
     mutating func previous() -> SirenFrame? {
         guard !self.frames.isEmpty else { return nil }
         index = frames.index(before: index)
         if index == frames.startIndex {
             index = frames.endIndex
         }
         return frames[index]
     }
 }
 */
