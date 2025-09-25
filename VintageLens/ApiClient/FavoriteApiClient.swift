//
//  FavoriteApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import Foundation

class FavoriteApiClient {
    
    private(set) var favoriteList: [Vintage] = []
    
    
    func addToFavorites(vintage: Vintage) {
        favoriteList.append(vintage)
    }
    
    func removeFromFavorites(vintage: Vintage) {
        favoriteList.removeAll { $0.id == vintage.id }
    }
}
