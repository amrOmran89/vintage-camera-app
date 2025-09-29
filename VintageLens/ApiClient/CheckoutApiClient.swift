//
//  CheckoutApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 29.09.25.
//

import Foundation

class CheckoutApiClient {
    
    let client: ApiClient
    init(client: ApiClient) {
        self.client = client
    }
    
    func createOrder(order: Order) async throws  {
        guard let url = URL(string: BuildConfig.baseUrl + "/lenses/all") else {
            throw ApiError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpBody = try JSONEncoder().encode(order)

        let _: String = try await client.fetchData(urlRequest: request)
        
    }
    
    func getOrder() async throws -> [Order] {
        guard let url = URL(string: BuildConfig.baseUrl + "/lenses/all") else {
            throw ApiError.invalidURL
        }
        let response: [Order] = try await client.fetchData(url: url)
        return response
    }
}
