//
//  OrderConfirmationView.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//


import SwiftUI

struct OrderConfirmationView: View {
    @Environment(DiscoverCoordinator.self) private var coordinator
    
    let camera: Vintage

    let orderNumber = "ORD123456"
    let quantity = 1
    let estimatedDelivery = "Sep 28, 2025"
    
    var body: some View {
        VStack(spacing: 24) {
            
            // MARK: Success Icon
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .padding(.top, 40)
            
            // MARK: Thank You Message
            Text("Thank You!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Your order has been placed successfully.")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Divider()
            
            // MARK: Order Summary
            VStack(alignment: .leading, spacing: 8) {
                Text("Order Summary")
                    .fontWeight(.bold)
                
                HStack {
                    Text("Item:")
                    Spacer()
                    Text(camera.brand)
                }
                
                HStack {
                    Text("Order Number:")
                    Spacer()
                    Text(orderNumber)
                }
                
                HStack {
                    Text("Total Price:")
                    Spacer()
                    Text(camera.price, format: .currency(code: camera.currency))
                }
                
                HStack {
                    Text("Estimated Delivery:")
                    Spacer()
                    Text(estimatedDelivery)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            
            Spacer()
            
            // MARK: Back to Shop Button
            Button {
                coordinator.popToRoot()
            } label: {
                Text("Back to Shop")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
        .padding()
        .navigationTitle("Order Complete")
        .navigationBarTitleDisplayMode(.inline)
    }
}
