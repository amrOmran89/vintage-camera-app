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
    
    func getDslrSection() async throws -> CameraSection {
        guard let url = URL(string: BuildConfig.baseUrl + "/dslr/section") else {
            throw ApiError.invalidURL
        }
        let response: CameraSection = try await client.fetchData(url: url)
        return response
    }
    
    func getAllCameras() async throws -> [Camera] {
        guard let url = URL(string: BuildConfig.baseUrl + "/dslr/all") else {
            throw ApiError.invalidURL
        }
        let response: [Camera] = try await client.fetchData(url: url)
        return response
    }
}
