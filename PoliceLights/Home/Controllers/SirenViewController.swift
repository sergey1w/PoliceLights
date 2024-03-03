//
//  SirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 03.03.2024.
//

import UIKit

final class SirenViewController: UIViewController {
    
    private let sirenView = SirenView(model: redBlue)
    private let frames: [SirenFrame]
    private var frameIndex = 0
    private var timer: Timer? = nil
    private let frequency: Double = 6 // Flashing frequency in Hz
    
    init(frames: [SirenFrame]) {
        self.frames = frames
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startFlashing()
    }
    
    func startFlashing() {
        timer = Timer.scheduledTimer(timeInterval: 1.0 / frequency, target: self, selector: #selector(displaySirenLights), userInfo: nil, repeats: true)
        displaySirenLights()
    }
    
    func stopFlashing() {
        timer?.invalidate()
    }
    
    @objc private func displaySirenLights() {
        UIView.animate(withDuration: 0) { [self] in
            sirenView.setFrame(frame: frames[frameIndex])
        } completion: { [self] _ in
            frameIndex = (frameIndex + 1) % frames.count
        }
    }
    
    @objc private func closeSiren() {
        timer?.invalidate()
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
    
    func setupSirenView() {
        view.addSubview(sirenView)
        sirenView.snap(to: self.view.safeAreaLayoutGuide, [.leading,.trailing, .top, .bottom])
    }
}
