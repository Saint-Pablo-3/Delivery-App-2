//
//  RequestBuilder.swift
//  Delivery App
//
//  Created Created by Pavel Reshetov on 22/06/2023.
//

import Foundation

class RequestBuilder {
	
	private var urlComponents = URLComponents()
	private var method: String = "GET"
	private var headers: [String: String] = [:]
	private var body: Data?
	
	func setBaseUrl(_ urlString: String) -> RequestBuilder {
		if let url = URL(string: urlString) {
			self.urlComponents.scheme = url.scheme
			self.urlComponents.host = url.host
			self.urlComponents.port = url.port
		}
		return self
	}
	
	func setPath(_ path: String) -> RequestBuilder {
		self.urlComponents.path = path
		return self
	}
	
	func addQueryItem(_ name: String, _ value: String) -> RequestBuilder {
		if self.urlComponents.queryItems == nil {
			self.urlComponents.queryItems = []
		}
		self.urlComponents.queryItems?.append(URLQueryItem(name: name, value: value))
		return self
	}

	func setMethod(_ method: String) -> RequestBuilder {
		self.method = method
		return self
	}
	
	func setHeader(_ key: String, _ value: String) -> RequestBuilder {
		self.headers[key] = value
		return self
	}
	
	func setBody(_ body: Data?) -> RequestBuilder {
		self.body = body
		return self
	}
	
	func build() -> URLRequest? {
		guard let url = self.urlComponents.url else { return nil }
		
		var request = URLRequest(url: url)
		request.httpMethod = self.method
		
		for (key, value) in headers {
			request.addValue(value, forHTTPHeaderField: key)
		}
		
		request.httpBody = body
		
		return request
	}
}
