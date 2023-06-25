//
//  Requester.swift
//  Delivery App
//
//  Created Created by Pavel Reshetov on 22/06/2023.
//

import Foundation
// универсальный реквестер
class Requester {
	func fetch<T: Codable>(request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) {
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard let data = data else {
				self.completeResult(
					completion: completion,
					result: .failure(error ?? NSError(domain: "Error", code: 0, userInfo: nil))
				)
				return
			}
			
			do {
				
				guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) else {
					fatalError("Unable to convert data to JSON object")
				}
				
				let decoder = JSONDecoder()
				
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let dtoModel = try decoder.decode(T.self, from: data)
				self.completeResult(
					completion: completion,
					result: .success(dtoModel)
				)
			} catch {
				self.completeResult(
					completion: completion,
					result: .failure(error)
				)
			}
		}.resume()
	}
	
	// для того чтобы сразу вернуться в главный поток
	private func completeResult<T: Codable>(
		completion: @escaping (Result<T, Error>) -> Void,
		result: (Result<T, Error>)
	) {
		DispatchQueue.main.async {
			completion(result)
		}
	}
}



