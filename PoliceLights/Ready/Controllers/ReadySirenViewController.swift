//
//  ReadySirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class ReadySirenViewController: UIViewController {
    
    private let headerViewReuseID = "ReadySirensHeaderFooterView"

    private let collectionView: UICollectionView
    private let sirens: [ReadySirenModel]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .leading, verticalAlignment: .bottom)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 32
        layout.minimumLineSpacing = 32
        layout.sectionInset.top = 8
        self.collectionView = .init(frame: .zero, collectionViewLayout: layout)
        self.sirens = ReadySirensParser().getSirens()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            ReadySirenCollectionViewCell.self,
            forCellWithReuseIdentifier: ReadySirenCollectionViewCell.reuseID
        )
        collectionView.register(
            ReadySirensHeaderFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: headerViewReuseID
        )
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snap(to: self.view.safeAreaLayoutGuide, [.leading,.trailing,.bottom])
        collectionView.snap(to: self.view.safeAreaLayoutGuide, [.top], constant: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ReadySirenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sirens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReadySirenCollectionViewCell.reuseID,
            for: indexPath
        ) as? ReadySirenCollectionViewCell
        else {
            return .init()
        }
        cell.configure(sirens[indexPath.item])
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: headerViewReuseID,
            for: indexPath
        ) as? ReadySirensHeaderFooterView else {
            return .init()
        }
        return header
    }
}

extension ReadySirenViewController: UICollectionViewDelegate {}

extension ReadySirenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = ReadySirensHeaderFooterView()
        let targetSize = CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height)
        return headerView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required, // Width is fixed
            verticalFittingPriority: .fittingSizeLevel // Height can be as large as needed
        )
    }
}
