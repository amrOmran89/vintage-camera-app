//
//  FavoriteView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct FavoriteView: View {
    
    @Environment(FavoriteViewModel.self) var viewModel
    
    var body: some View {
        if viewModel.cameras.isEmpty {
            ContentUnavailableView("You don't have any favorites yet.", systemImage: "heart.fill", description: Text("Manage your wishlist and saved searches"))
        } else {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                ]) {
                    ForEach(viewModel.cameras) { vintage in
                        VintageCardView(vintage: vintage)
                    }
                }
                .padding(.bottom, 30)
                .padding(.horizontal)
            }
        }
    }
}


@Observable
class FavoriteViewModel {
    
    let cameras = [Camera]()
    var badgeCount: Int = 0
    
    init() {
        Task {
            do {
                try await getFavoriteBadgeCount(client: FavoriteApiClient(client: .init()), id: 1)
            } catch {
                print(error)
            }
        }
    }
    
    func addOrRemoveFromFavorite(favorite: Favorite) async {
        let client = FavoriteApiClient(client: .init())
        do {
            if try await isFavorite(client: client, userId: favorite.userId, productId: favorite.productId) {
                try await removeFromFavorite(client: client, favorite: favorite)
            } else {
                try await addToFavorite(client: client, favorite: favorite)
            }
        } catch {
            print(error)
        }
    }
    
    func addToFavorite(client: FavoriteApiClient, favorite: Favorite) async throws {
        try await client.addToFavorites(favorite: favorite)
        try await getFavoriteBadgeCount(client: client, id: 1)
    }
    
    func removeFromFavorite(client: FavoriteApiClient, favorite: Favorite) async throws {
        try await client.removeFromFavorites(favorite: favorite)
        try await getFavoriteBadgeCount(client: client, id: 1)
    }
    
    private func getFavoriteBadgeCount(client: FavoriteApiClient, id: Int) async throws {
        let result = try await client.getAllFavorites(userId: id)
        badgeCount = result.count
    }
    
    private func isFavorite(client: FavoriteApiClient, userId: Int, productId: Int) async throws -> Bool {
        let favoriteList = try await client.getAllFavorites(userId: userId)
        let doesContain = favoriteList.contains(where: { $0.productId == productId })
        return doesContain
    }
}
