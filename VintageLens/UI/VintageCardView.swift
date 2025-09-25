//
//  VintageCardView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct VintageCardView: View {
    let vintage: Vintage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(vintage.image)
                .resizable()
                .scaledToFit()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .cornerRadius(12)
                .clipped()
            
            Text(vintage.brand)
                .font(.headline)
                .lineLimit(1)
            
            Text(vintage.model)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
