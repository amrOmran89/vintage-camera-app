//
//  LensesApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

class LensesApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    func getTopLenses() async throws -> LensesResponse {
        guard let url = URL(string: BuildConfig.baseUrl + "/lenses/top") else {
            throw ApiError.invalidURL
        }
        let response: LensesResponse = try await client.fetchData(url: url)
        return response
    }
    
    func getAllLenses() async throws -> [Lens] {
        guard let url = URL(string: BuildConfig.baseUrl + "/lenses/all") else {
            throw ApiError.invalidURL
        }
        let response: [Lens] = try await client.fetchData(url: url)
        return response
    }
}
