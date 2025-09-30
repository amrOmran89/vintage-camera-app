//
//  FavoriteApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import Foundation

class FavoriteApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    @discardableResult
    func addToFavorites(favorite: Favorite) async throws -> ResponseBody {
        guard let url = URL(string: BuildConfig.baseUrl + "/favorites") else {
            throw ApiError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(favorite)
        request.httpBody = data
        
        let response: ResponseBody = try await client.fetchData(urlRequest: request)
        return response
    }
    
    @discardableResult
    func removeFromFavorites(favorite: Favorite) async throws -> ResponseBody {
        guard let url = URL(string: BuildConfig.baseUrl + "/favorites") else {
            throw ApiError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let data = try encoder.encode(favorite)
        request.httpBody = data
        
        let response: ResponseBody = try await client.fetchData(urlRequest: request)
        return response
    }
    
    func getAllFavorites(userId: Int) async throws -> [Favorite] {
        guard let url = URL(string: BuildConfig.baseUrl + "/favorites/\(userId)") else {
            throw ApiError.invalidURL
        }
        let data: [Favorite] = try await client.fetchData(urlRequest: URLRequest(url: url))
        return data
    }
}
