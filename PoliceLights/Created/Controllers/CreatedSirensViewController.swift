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
    
    private func setupUI() {
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .leading, verticalAlignment: .bottom)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 32
        layout.minimumLineSpacing = 16
        layout.sectionInset.top = 16
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
//        collectionView.delegate = self
        collectionView.register(
            CreatedSirenCollectionViewCell.self,
            forCellWithReuseIdentifier: CreatedSirenCollectionViewCell.reuseID
        )
//        collectionView.register(
//            ReadySirensHeaderFooterView.self,
//            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: headerViewReuseID
//        )
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
//        cell.setDelegate(self)
        return cell
    }
    
//    func collectionView(
//        _ collectionView: UICollectionView,
//        viewForSupplementaryElementOfKind kind: String,
//        at indexPath: IndexPath
//    ) -> UICollectionReusableView {
//        guard let header = collectionView.dequeueReusableSupplementaryView(
//            ofKind: kind,
//            withReuseIdentifier: headerViewReuseID,
//            for: indexPath
//        ) as? ReadySirensHeaderFooterView else {
//            return .init()
//        }
//        header.setDelegate(self)
//        return header
//    }
}
