//
//  NetworkService.swift
//  Delivery App
//
//  Created Created by Pavel Reshetov on 22/06/2023.
//

import Foundation

// класс нетворк сервис для работы с сетью
class NetworkService {
	private let requester: Requester
	private let requestBuilder: RequestBuilder
	
	init(
		requester: Requester,
		requestBuilder: RequestBuilder
	) {
		self.requester = requester
		self.requestBuilder = requestBuilder
	}
	
	func fetchGoods(completion: @escaping (Result<[SubSectionDTO], Error>) -> Void) {
		guard let request = requestBuilder
			.setBaseUrl("https://jsonplaceholder.typicode.com")
			.setPath("/posts")
			.build()
		else {
			return completion(.failure(NSError(domain: "invalid request", code: 1)))
		}
		
		requester.fetch(request: request, completion: completion)
	}
}


struct ProductDTO: Codable {
	let image: Data
	let title: String
	let ingredients: String
	let price: Double 
}

struct SubSectionDTO: Codable {
	let productsDTO: [ProductDTO]
}
