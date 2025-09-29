//
//  VintageApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

class VintageApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    func getVintageSection() async throws -> CameraSection {
        guard let url = URL(string: BuildConfig.baseUrl + "/vintages") else {
            throw ApiError.invalidURL
        }
        let response: CameraSection = try await client.fetchData(url: url)
        return response
    }
    
    func getAll() async throws -> [Camera] {
        guard let url = URL(string: BuildConfig.baseUrl + "/vintages/all") else {
            throw ApiError.invalidURL
        }
        let response: [Camera] = try await client.fetchData(url: url)
        return response
    }
}
