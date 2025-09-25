//
//  LensesSection.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct LensesSection: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    
    let lenses: LensesResponse
    
    var body: some View {
        Group {
            HeaderTitle(text: lenses.title) {
                coordinator.push(.lensesOverview)
            }
            .padding(.top)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(lenses.items) { lens in
                        LensCardView(lens: lens)
                    }
                }
                .padding(.leading)
                .padding(.vertical, 4)
            }
            .frame(height: 180)
        }
    }
}
