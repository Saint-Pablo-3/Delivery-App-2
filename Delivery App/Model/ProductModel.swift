//
//  ProductModel.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 23/06/2023.
//

import UIKit

// модель одного продукта
struct ProductModel {
	let image: UIImage?
	let title: String
	let ingredients: String
	let price: Double
	let onTap: () -> ()
}

// модель баннера
struct BannerModel {
	let image: UIImage?
}

//// тип секций
enum Section {
	case banners([BannerModel])
	case productsModel([ProductsModel])
}

struct source {
	let sections: [Section]
}

struct ProductsModel {
	let products: [ProductModel]
}
