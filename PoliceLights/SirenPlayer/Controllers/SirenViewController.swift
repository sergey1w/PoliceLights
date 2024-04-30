//
//  SirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 03.03.2024.
//

import UIKit
import AVFAudio

final class SirenViewController: UIViewController {
    
    private let sirenView = SirenView(frame: .zero)
    private var frameIndex = 0
    private var timer: Timer? = nil
    private let model: SirenModel
    private let sound: SirenSound?
    
    private var audioPlayer: AVAudioPlayer?
    
    init(model: SirenModel, sound: SirenSound?) {
        self.model = model
        self.sound = sound
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        setupUI()
        startFlashing()
    }
    
    func startFlashing() {
        timer = Timer.scheduledTimer(
            timeInterval: 1.0 / Double(model.frequency),
            target: self,
            selector: #selector(displaySirenLights),
            userInfo: nil,
            repeats: true
        )
        displaySirenLights()
        audioPlayer?.play()
    }
    
    func stopFlashing() {
        timer?.invalidate()
        audioPlayer?.stop()
    }
    
    @objc private func displaySirenLights() {
        UIView.animate(withDuration: 0) { [self] in
            sirenView.setFrame(frame: model.frames[frameIndex])
        } completion: { [self] _ in
            frameIndex = (frameIndex + 1) % model.frames.count
        }
    }
    
    @objc private func closeSiren() {
        stopFlashing()
        dismiss(animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SirenViewController {
    func setupUI() {
        setupSirenView()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeSiren))
        sirenView.addGestureRecognizer(gesture)
    }
    
    func setupAudioPlayer() {
        if let soundURL = sound?.audioURL {
            do {
                self.audioPlayer = try .init(contentsOf: soundURL)
                self.audioPlayer?.numberOfLoops = -1
                self.audioPlayer?.prepareToPlay()
            } catch {
                
            }
        }
    }
    
    func setupSirenView() {
        view.addSubview(sirenView)
        sirenView.snap(to: self.view.safeAreaLayoutGuide, [.leading,.trailing, .top, .bottom])
    }
}
