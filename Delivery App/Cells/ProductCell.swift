//
//  MenuCollectionViewCell.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 23/06/2023.
//

import UIKit

class ProductCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        selectionStyle = .none
        stackView.layer.cornerRadius = 16
        stackView.backgroundColor = .white
        self.backgroundColor = .clear
        
        [stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func configureCell(with products: [ProductModel]) {
        products.enumerated().forEach { index, product in
            let isLast = products.index(before: products.endIndex) == index
            let view = makeProductView(with: product, isHidden: isLast)
            stackView.addArrangedSubview(view)
        }
    }
    
    func makeProductView(with product: ProductModel, isHidden: Bool) -> ProductView {
        let productView = ProductView()
        productView.productImageView.image = product.image
        productView.productTitleLabel.text = product.title
        productView.ingredientsLabel.text = product.ingredients
        productView.priceButton.setTitle("от \(Int(product.price)) р", for: .normal) // заменить на currencyFormatter
        productView.onTap = product.onTap
        productView.separatorView.isHidden = isHidden
        return productView
    }
    
    override func prepareForReuse() {
		stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}


