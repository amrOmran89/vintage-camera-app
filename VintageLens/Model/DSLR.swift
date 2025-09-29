//
//  DSLR.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

struct Camera: Codable, Identifiable, Hashable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let image: String
    let price: Double
    let currency: Currency
    let description: String
    let seller: Seller
    let type: CameraType
}

struct CameraSection: Codable {
    let title: String
    let items: [Camera]
}


enum CameraType: String, Codable, Hashable {
    case vintage = "VINTAGE"
    case dslr = "DSLR"
    case mirrorless = "MIRRORLESS"
    case compact = "COMPACT"
    case action = "ACTION"
    case mediumFormat = "MEDIUM_FORMAT"
}

enum Currency: String, Codable, Hashable {
    case eur = "EUR"
    case usd = "USD"
    
    var symbol: String {
        switch self {
        case .eur:
            "€"
        case .usd:
            "$"
        }
    }
}
