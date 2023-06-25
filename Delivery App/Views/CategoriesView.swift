//
//  CategoriesView.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 24/06/2023.
//

import UIKit

protocol CategoriesViewDelegate {
	func categoryDidTap(index: Int)
}

class CategoriesView: UIView {

	let scrollView = UIScrollView()
	
	var categories = ["Пицца", "Комбо", "Десерт", "Напитки"]
	
	var buttonArray = [UIButton]()
	
	var delegate: CategoriesViewDelegate?

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupViews() {
		
		addSubview(scrollView)
		
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsHorizontalScrollIndicator = false
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
			scrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
		])
		
		let stackView = UIStackView(arrangedSubviews: categories.enumerated().map {
			let button = createButton(with: $1, index: $0)
			buttonArray.append(button)
			
			return button
		}
									
		)
		
		stackView.spacing = 8
		stackView.distribution = .fill
		backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
		
		scrollView.addSubview(stackView)
		stackView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
		])
	}
	
	func createButton(with categories: String, index: Int) -> UIButton {
		let button = UIButton()
		button.tag = index
		button.setTitle(categories, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
		button.setTitleColor(UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 0.4), for: .normal)
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 0.4).cgColor
		button.layer.cornerRadius = 19
		button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
		button.addTarget(self, action: #selector(getIndex(_:)), for: .touchUpInside)

		return button
	}
	
	@objc func getIndex(_ sender: UIButton) {
		
		buttonArray.forEach { button in
			button.backgroundColor = UIColor(red: 243/255.0, green: 245/255.0, blue: 249/255.0, alpha: 1.0)
			button.setTitleColor(UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 0.4), for: .normal)
			button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
			button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 25, bottom: 10, right: 25)
		}
		
		sender.backgroundColor = UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 0.4)
		sender.setTitleColor(UIColor(red: 253.0/255.0, green: 59.0/255.0, blue: 104.0/255.0, alpha: 1.0), for: .normal)
		sender.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
		sender.contentEdgeInsets = UIEdgeInsets(top: 10, left: 24, bottom: 10, right: 24)
		
		print(sender.tag)
		
		
		delegate?.categoryDidTap(index: sender.tag)
	}
}
