//
//  BannerCell.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 22/06/2023.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    var bannerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews() {
        addSubview(bannerImageView)
		bannerImageView.translatesAutoresizingMaskIntoConstraints = false
		bannerImageView.clipsToBounds = true
		bannerImageView.contentMode = .scaleAspectFill
		bannerImageView.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
			bannerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			bannerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
			bannerImageView.topAnchor.constraint(equalTo: topAnchor),
			bannerImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
