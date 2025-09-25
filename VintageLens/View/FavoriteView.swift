//
//  FavoriteView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct FavoriteView: View {
    
    @State var viewModel = FavoriteViewModel()
    
    var body: some View {
        if viewModel.favoriteList.isEmpty {
            ContentUnavailableView("You don't have any favorites yet.", systemImage: "heart.fill", description: Text("Manage your wishlist and saved searches"))
        } else {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 100)),
                    GridItem(.flexible(minimum: 100)),
                ]) {
                    ForEach(viewModel.favoriteList) { vintage in
                        VintageCardView(vintage: vintage)
                    }
                }
                .padding(.bottom, 30)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    FavoriteView()
}

@Observable
class FavoriteViewModel {
    
    var favoriteList = FavoriteApiClient().favoriteList
}
