//
//  ReadySirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class ReadySirenViewController: UIViewController {

    private let collectionView: UICollectionView
    private let sirens: [ReadySirenModel]
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        var layout = AlignedCollectionViewFlowLayout(horizontalAlignment: .leading, verticalAlignment: .bottom)
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumInteritemSpacing = 32
        layout.minimumLineSpacing = 32
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
}

extension ReadySirenViewController: UICollectionViewDelegate {
    
}
