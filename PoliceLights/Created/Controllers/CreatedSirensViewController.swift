//
//  CreatedSirensViewController.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//

import UIKit

final class CreatedSirensViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private let sirens: [SirenModel]
    
    init(sirens: [SirenModel]) {
        self.sirens = sirens
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func setupUI() {
        title = "Created"
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .leading, verticalAlignment: .bottom)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 32
        layout.minimumLineSpacing = 16
        layout.sectionInset.top = 16
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CreatedSirenCollectionViewCell.self,
            forCellWithReuseIdentifier: CreatedSirenCollectionViewCell.reuseID
        )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snap(to: self.view.safeAreaLayoutGuide, [.leading,.trailing,.bottom, .top])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreatedSirensViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sirens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CreatedSirenCollectionViewCell.reuseID,
            for: indexPath
        ) as? CreatedSirenCollectionViewCell
        else {
            return .init()
        }
        let model = sirens[indexPath.item]
        cell.configure(model: model)
        return cell
    }
}

extension CreatedSirensViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = sirens[indexPath.item]
        let vc = SirenViewController(model: item)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
