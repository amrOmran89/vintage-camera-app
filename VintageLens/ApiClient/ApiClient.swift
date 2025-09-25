//
//  ApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case noDataReturned
    case unknownError
    case statusCode(Int)
}

class ApiClient {
    
    let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = .init()) {
        self.decoder = decoder
    }
    
    @concurrent func fetchData<T: Codable>(url: URL) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse else {
            throw ApiError.unknownError
        }
        guard (200..<300).contains(response.statusCode) else {
            throw ApiError.statusCode(response.statusCode)
        }
        guard !data.isEmpty else {
            throw ApiError.noDataReturned
        }
        
        let codable = try decoder.decode(T.self, from: data)
        return codable
    }
    
    @concurrent func fetchData<T: Codable>(urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw ApiError.unknownError
        }
        guard (200..<300).contains(response.statusCode) else {
            throw ApiError.statusCode(response.statusCode)
        }
        guard !data.isEmpty else {
            throw ApiError.noDataReturned
        }
        
        let codable = try decoder.decode(T.self, from: data)
        return codable
    }
}
