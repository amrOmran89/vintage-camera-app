//
//  DslrSection.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct DslrSection: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    
    let dslr: CameraSection
    
    var body: some View {
        Group {
            HeaderTitle(text: dslr.title) {
                
            }
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(dslr.items) { dslr in
                        DSLRCardView(dslr: dslr)
                            .onTapGesture {
                                coordinator.push(.details(dslr))
                            }
                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal)
            }
            .scrollTargetBehavior(.viewAligned)
            .frame(height: 410)
        }
    }
}
