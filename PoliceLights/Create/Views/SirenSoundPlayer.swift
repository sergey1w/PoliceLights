//
//  SirenSoundPlayer.swift
//  PoliceLights
//
//  Created by sergey on 25.03.2024.
//

import UIKit
import AVFAudio


final class SirenSoundPlayer: UIView {
    
    let buttonGroup = RoundedButtonGroup<Selection>(titleHidden: true, offButton: true)
    private(set) var sound: SirenSound?
    private var audioPlayer: AVAudioPlayer?
    private let testButton: RoundedButton = {
        let btn = RoundedButton()
        btn.setTitle("Test", for: .normal)
        return btn
    }()
    private let stopButton: RoundedButton = {
        let btn = RoundedButton()
        btn.setTitle("Stop", for: .normal)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        setupUI()
        testButton.addTarget(self, action: #selector(testSound), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopSound), for: .touchUpInside)
        setDelegate(self)
        buttonGroup.configure(title: "sirens", selections: SirenSound.allCases)
    }
    
    @objc func testSound() {
        if let soundURL = sound?.audioURL {
            do {
                self.audioPlayer = try .init(contentsOf: soundURL)
            } catch {}
            self.audioPlayer?.numberOfLoops = -1
            self.audioPlayer?.prepareToPlay()
            self.audioPlayer?.play()
        }
    }
    
    @objc func stopSound() {
        self.audioPlayer?.stop()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SirenSoundPlayer {
    func setupUI() {
        addSubview(buttonGroup)
        addSubview(testButton)
        addSubview(stopButton)
        buttonGroup.snap(to: self, [.leading,.top,.trailing])
        testButton.snap(to: self, [.leading,.bottom])
        stopButton.snap(to: self, [.trailing,.bottom])
        
        NSLayoutConstraint.snap(
            [testButton.topAnchor, stopButton.topAnchor],
            [buttonGroup.bottomAnchor, buttonGroup.bottomAnchor],
            constants: [8,8]
        )
        NSLayoutConstraint.snap(
            [testButton.trailingAnchor],
            [stopButton.leadingAnchor],
            constants: [-16]
        )
        NSLayoutConstraint.snap([testButton.widthAnchor], [stopButton.widthAnchor])
    }
}

extension SirenSoundPlayer: RoundedButtonGroupContainer {
    typealias Selection = SirenSound
    
    func setDelegate(_ delegate: RoundedButtonGroupDelegate) {
        buttonGroup.delegate = delegate
    }
    
    func configure(title: String, selections: [SirenSound]) {
        buttonGroup.configure(title: title, selections: selections)
    }
}

extension SirenSoundPlayer: RoundedButtonGroupDelegate {
    func selected<T>(selection: T) {
        guard let selection = selection as? Selection else {
            sound = nil
            return
        }
        sound = selection
    }
}
