//
//  FavoriteApiClient.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import Foundation

class FavoriteApiClient {
    
    private(set) var favoriteList: [Camera] = []
    
    
    func addToFavorites(camera: Camera) {
        favoriteList.append(camera)
    }
    
    func removeFromFavorites(vintage: Camera) {
        favoriteList.removeAll { $0.id == vintage.id }
    }
}
