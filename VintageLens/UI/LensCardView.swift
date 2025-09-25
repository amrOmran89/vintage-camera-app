//
//  LensCardView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct LensCardView: View {
    let lens: Lens
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(lens.image)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 100)
                .cornerRadius(12)
                .clipped()
            
            Text(lens.brand)
                .font(.headline)
                .lineLimit(1)
            
            Text(lens.zoom)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding(8)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 2)
    }
}
