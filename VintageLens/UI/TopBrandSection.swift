//
//  TopBrandSection.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct TopBrandSection: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    
    let topBrands: BrandResponse
    
    var body: some View {
        Group {
            HeaderTitle(text: topBrands.title) {
                coordinator.push(.brandsOverview)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: [
                    GridItem(.fixed(50)),
                    GridItem(.fixed(50))
                ], spacing: 16) {
                    ForEach(topBrands.items) { brand in
                        BrandCardView(brand: brand)
                            .frame(width: 100, height: 120)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 120)
            
        }
    }
}
