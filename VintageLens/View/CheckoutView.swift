//
//  CheckoutView.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//


import SwiftUI

struct CheckoutView: View {
    
    @Environment(DiscoverCoordinator.self) private var coordinator
    let camera: Vintage
    
    @State private var shippingAddress = "John Doe\n123 Main St\nBerlin, Germany"
    @State private var paymentMethod = "Credit Card"
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // MARK: Order Summary
                    Text("Order Summary")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(camera.image) // Replace with product image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(12)
                            .clipped()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            HStack {
                                Text(camera.brand)
                                    .fontWeight(.semibold)
                                Text(camera.model)

                            }
                            
                            Text(camera.price, format: .currency(code: camera.currency))
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                    }
                    
                    Divider()
                    
                    // MARK: Shipping Address
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Shipping Address")
                            .fontWeight(.bold)
                        
                        Text(shippingAddress)
                            .foregroundColor(.secondary)
                        
                        Button {
                            // Edit shipping action
                        } label: {
                            Text("Edit")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Divider()
                    
                    // MARK: Payment Method
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Payment Method")
                            .fontWeight(.bold)
                        
                        Text(paymentMethod)
                            .foregroundColor(.secondary)
                        
                        Button {
                            // Change payment method
                        } label: {
                            Text("Change")
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Divider()
                    
                    // MARK: Total Price
                    HStack {
                        Text("Total")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                        Text(camera.price, format: .currency(code: camera.currency))
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                }
                .padding()
            }
            
            // MARK: Confirm Purchase Button
            Button {
                coordinator.push(.thankYou(camera))
            } label: {
                Text("Confirm Purchase")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.black)
                    .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
    }
}
