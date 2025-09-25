//
//  BrandCardView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//
import SwiftUI

struct BrandCardView: View {
    let brand: Brand
    var width: CGFloat = 70
    
    var body: some View {
        Text(brand.name)
            .font(.caption)
            .fontWeight(.medium)
            .frame(width: width)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.accentColor, lineWidth: 0.5)
            }
    }
}
