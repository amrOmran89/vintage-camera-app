//
//  BrandsApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import Foundation

class BrandsApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    func getTopBrands() async throws -> BrandResponse {
        guard let url = URL(string: BuildConfig.baseUrl + "/brands/top") else {
            throw ApiError.invalidURL
        }
        let response: BrandResponse = try await client.fetchData(url: url)
        return response
    }
    
    func getAllBrands() async throws -> [Brand] {
        guard let url = URL(string: BuildConfig.baseUrl + "/brands/all") else {
            throw ApiError.invalidURL
        }
        let response: [Brand] = try await client.fetchData(url: url)
        return response
    }
}

