//
//  DSLR.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

struct DSLR: Identifiable, Codable {
    let id: Int
    let brand: String
    let model: String
    let year: Int
    let image: String
}

struct DSLRResponse: Codable {
    let title: String
    let items: [DSLR]
}
