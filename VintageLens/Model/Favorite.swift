//
//  Favorite.swift
//  VintageLens
//
//  Created by Amr Omran on 29.09.25.
//

import Foundation

struct Favorite: Identifiable, Codable {
    let productId: Int
    let userId: Int
    
    var id: Int {
        productId
    }
}
