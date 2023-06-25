//
//  MockData.swift
//  Delivery App
//
//  Created by Pavel Reshetov on 22/06/2023.
//

import UIKit

struct MockData {
	func makeCells() -> [Section] {
		[
			.banners([
				.init(image: UIImage(named: "banner1")),
				.init(image: UIImage(named: "banner2")),
				.init(image: UIImage(named: "banner3"))
			]),
			
				.productsModel(
					[
						.init(
							products: [
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соусВетчина,шампиньоны, увеличинная порция моцареллы, томатный  соусВетчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("1")}
									 ),
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("2")}
									 ),
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("3")}
									 ),
							]
						),
						
							.init(
								products: [
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("1")}
										 ),
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("2")}
										 ),
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("3")}
										 ),
								]
							),
						
						.init(
							products: [
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("1")}
									 ),
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("2")}
									 ),
								.init(image: UIImage(named: "pizza"),
									  title: "Ветчина и грибы",
									  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
									  price: 450,
									  onTap: { print("3")}
									 ),
							]
						),
						
							.init(
								products: [
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("1")}
										 ),
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("2")}
										 ),
									.init(image: UIImage(named: "pizza"),
										  title: "Ветчина и грибы",
										  ingredients: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
										  price: 450,
										  onTap: { print("3")}
										 ),
								]
							),
						
						
					]
				)
		]
	}
}
