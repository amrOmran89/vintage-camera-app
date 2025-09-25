//
//  SellView.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import SwiftUI

struct SellView: View {
    var body: some View {
        ScrollView {
            
            Image(systemName: "camera")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical, 30)
            
            Text("Swift, Simple and Secure")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .padding(.bottom, 30)
            
            
            VStack(alignment: .leading, spacing: 20) {
                Label("Create a free listing", systemImage: "tag")
                Label("Fair commision fees for completed sales", systemImage: "eurosign.bank.building")
                Label("Secure pauments", systemImage: "lock")
            }
            .padding(.bottom, 30)
            
            Button {
                
            } label: {
                Text("Get started")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SellView()
}
