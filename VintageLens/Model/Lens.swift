//
//  Lens.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import Foundation

struct Lens: Identifiable, Codable {
    var id: Int
    var brand: String
    var zoom: String
    var image: String
}

struct LensesResponse: Codable {
    var title: String
    var items: [Lens]
}
