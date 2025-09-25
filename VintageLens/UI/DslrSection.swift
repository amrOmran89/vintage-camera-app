//
//  DslrSection.swift
//  VintageLens
//
//  Created by Amr Omran on 24.09.25.
//

import SwiftUI

struct DslrSection: View {
    let dslr: DSLRResponse
    
    var body: some View {
        Group {
            HeaderTitle(text: dslr.title) {
                
            }
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 10) {
                    ForEach(dslr.items) { dslr in
                        DSLRCardView(dslr: dslr)
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
