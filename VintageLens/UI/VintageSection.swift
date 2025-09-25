//
//  VintageSection.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct VintageSection: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    
    let vintage: VintageResponse
    
    var body: some View {
        Group {
            HeaderTitle(text: vintage.title) {
                coordinator.push(.vintageOverview)
            }
            .padding(.top)
            
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100)),
                GridItem(.flexible(minimum: 100)),
            ]) {
                ForEach(vintage.items) { vintage in
                    VintageCardView(vintage: vintage)
                        .onTapGesture {
                            coordinator.push(.details(vintage))
                        }
                }
            }
            .padding(.bottom, 30)
            .padding(.horizontal)
        }
    }
}
