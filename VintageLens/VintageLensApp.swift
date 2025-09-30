//
//  VintageLensApp.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

@main
struct VintageLensApp: App {
    
    @State private var discoveryCoordinator = DiscoverCoordinator()
    @State private var authentication = AuthenticationService()
    @State var favoriteViewModel = FavoriteViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                Tab("Discover", systemImage: "house") {
                    NavigationStack(path: $discoveryCoordinator.path) {
                        DiscoverView()
                            .navigationDestination(for: DiscoverCoordinator.Screens.self) { screen in
                                discoveryCoordinator.goToView(screen)
                            }
                    }
                    .environment(discoveryCoordinator)
                }
                
                Tab("Favorites", systemImage: "heart") {
                    FavoriteView()
                }
                .badge(favoriteViewModel.badgeCount)
                
                Tab("Sell", systemImage: "tag") {
                    SellView()
                }
                
                Tab("Account", systemImage: "person") {
                    ProfileView()
                }
                
                Tab(role: .search) {
                    NavigationStack {
                        SearchView()
                    }
                }
            }
            .tabViewStyle(.tabBarOnly)
            .environment(authentication)
            .environment(favoriteViewModel)
        }
    }
}
