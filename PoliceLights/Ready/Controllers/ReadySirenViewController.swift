//
//  ReadySirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class ReadySirenViewController: UIViewController {
    
    
    private let headerViewReuseID = "ReadySirensHeaderFooterView"

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private(set) var sirenSound: SirenSound?
    private let readySirens: [ReadySirenModel] = ReadySirensParser().getSirens()
    
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
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.snap(to: self.view.safeAreaLayoutGuide, [.leading,.trailing,.bottom, .top])
    }
}

extension ReadySirenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        readySirens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReadySirenCollectionViewCell.reuseID,
            for: indexPath
        ) as? ReadySirenCollectionViewCell
        else {
            return .init()
        }
        let model = readySirens[indexPath.item]
        cell.configure(title: model.title.uppercased(), selections: model.sirens)
        cell.setDelegate(self)
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
        header.setDelegate(self)
        return header
    }
}

extension ReadySirenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        let headerView = ReadySirensHeaderFooterView()
        let targetSize = CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height)
        return headerView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required, // Width is fixed
            verticalFittingPriority: .fittingSizeLevel // Height can be as large as needed
        )
    }
}


extension ReadySirenViewController: RoundedButtonGroupDelegate {
    func selected<T>(selection: T) {
        switch selection {
        case let sound as Optional<SirenSound>:
            sirenSound = sound
        case let readySiren as ReadySiren:
            let vc: UIViewController
            switch readySiren {
            case .siren(let sirenModel):
                vc = SirenViewController(model: sirenModel.with(sound: sirenSound))
            case .special(let specialSirenModel):
                vc = SpecialSirenController(model: specialSirenModel, sound: sirenSound)
            }
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .crossDissolve
            present(vc, animated: true)
        default:
            return
        }
    }
}
