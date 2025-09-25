//
//  Brand.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct Brand: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String
}

struct BrandResponse: Codable {
    let title: String
    let items: [Brand]
}
