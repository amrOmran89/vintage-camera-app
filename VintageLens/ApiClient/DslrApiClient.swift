//
//  DslrApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

class DslrApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    func getDslr() async throws -> CameraSection {
        guard let url = URL(string: BuildConfig.baseUrl + "/dslrs") else {
            throw ApiError.invalidURL
        }
        let response: CameraSection = try await client.fetchData(url: url)
        return response
    }
}
