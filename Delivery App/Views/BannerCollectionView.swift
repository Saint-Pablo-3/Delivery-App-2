//
//  BannerCollectionView.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 22/06/2023.
//

import UIKit

class BannerCollectionView: UIView {

	var source: [BannerModel] = [] {
		didSet {
			collectionView.reloadData()
		}
	}

	lazy var collectionView: UICollectionView = {
		let flowLayout = setupFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
		collectionView.dataSource = self
		collectionView.register(BannerCell.self, forCellWithReuseIdentifier: String(describing: BannerCell.self))
		collectionView.showsHorizontalScrollIndicator = false
		return collectionView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupCollectionView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupCollectionView() {
		addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	func setupFlowLayout() -> UICollectionViewFlowLayout {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = .init(width: 300, height: 112)
		layout.scrollDirection = .horizontal
		layout.minimumInteritemSpacing = 16
		return layout
	}
}

extension BannerCollectionView: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		source.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: BannerCell.self), for: indexPath) as? BannerCell else {
			return UICollectionViewCell()
		}
		
		cell.bannerImageView.image = source[indexPath.item].image
		return cell
	}
}
