//
//  Vintage.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

struct Vintage: Identifiable, Hashable, Codable {
    let id: Int
    let brand: String
    let model: String
    let image: String
    let price: Double
    let currency: String
    let description: String
    let seller: Seller
}

struct VintageResponse: Codable {
    let title: String
    let items: [Vintage]
}
