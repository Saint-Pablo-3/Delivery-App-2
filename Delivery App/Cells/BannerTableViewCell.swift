//
//  BannerTableViewCell.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 22/06/2023.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
	
	let bannerCollectionView = BannerCollectionView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		contentView.addSubview(bannerCollectionView)
		bannerCollectionView.translatesAutoresizingMaskIntoConstraints = false
	
		NSLayoutConstraint.activate([
			bannerCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bannerCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
			bannerCollectionView.topAnchor.constraint(equalTo: topAnchor),
			bannerCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
			bannerCollectionView.heightAnchor.constraint(equalToConstant: 112)
		])
	}
	
	func configureCell(with banner: [BannerModel]) {
		bannerCollectionView.source = banner
		setNeedsLayout()
	}
}
