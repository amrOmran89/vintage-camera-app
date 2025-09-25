//
//  DSLRCardView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct DSLRCardView: View {
    let dslr: DSLR
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(dslr.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .cornerRadius(16)
                .clipped()
            
            VStack(alignment: .leading, spacing: 4) {
                Text(dslr.brand)
                    .font(.headline)
                
                Text(dslr.model)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("Released: \(dslr.year)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 8)
        }
        .padding()
        .frame(height: 400)
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 2)
    }
}
