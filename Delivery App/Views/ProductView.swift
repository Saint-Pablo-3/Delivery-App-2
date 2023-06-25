//
//  ProductView.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 23/06/2023.
//
import UIKit

class ProductView: UIView {

    var productImageView = UIImageView()
    var productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    var ingredientsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    var priceButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 1.0), for: .normal)
        button.layer.cornerRadius = 6
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 1.0).cgColor
        button.setTitleColor(.red, for: .highlighted)
        return button
    }()
    
    var onTap: (() -> ())?
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        onTap?()
    }
    
    func setupViews() {
        [productImageView, productTitleLabel, ingredientsLabel, priceButton, separatorView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        priceButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: productTitleLabel.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -16),
            productImageView.heightAnchor.constraint(equalToConstant: 100),
            productImageView.widthAnchor.constraint(equalToConstant: 100),
            
            productTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productTitleLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            productTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            ingredientsLabel.topAnchor.constraint(equalTo: productTitleLabel.bottomAnchor, constant: 8),
            ingredientsLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 10),
            ingredientsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ingredientsLabel.bottomAnchor.constraint(equalTo: priceButton.topAnchor, constant: -5),
            
            priceButton.heightAnchor.constraint(equalToConstant: 32),
            priceButton.widthAnchor.constraint(equalToConstant: 87),
            priceButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])


    }

}
