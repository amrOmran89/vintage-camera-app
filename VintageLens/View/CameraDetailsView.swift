//
//  CameraDetailsView.swift
//  VintageLens
//
//  Created by Amr Omran on 23.09.25.
//

import SwiftUI

struct CameraDetailsView: View {
    
    @Environment(DiscoverCoordinator.self) var coordinator
    @Environment(AuthenticationService.self) var authentication
    
    @State private var showAlert = false
    @State private var suggestPrice = ""
    @State private var showLogin: Bool = false
    
    let camera: Vintage
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image(camera.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(16)
                        .clipped()
                    
                    // MARK: Views & Title
                    Label("811 views in 48 hours", systemImage: "flame")
                        .foregroundColor(.red)
                        .font(.caption)
                    
                    HStack(alignment: .center) {
                        Text(camera.brand)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(camera.model)
                            .font(.body)
                    }
                    
                    // MARK: Price & Shipping
                    VStack(alignment: .leading, spacing: 8) {
                        Text(camera.price, format: .currency(code: "EUR"))
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Free insured shipping within Germany")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Condition: Excellent, like new")
                            .font(.subheadline)
                    }
                    
                    Divider()
                    
                    // MARK: Seller Info
                    HStack(spacing: 16) {

                        VStack(alignment: .leading) {
                            Text(camera.seller.name)
                                .fontWeight(.bold)
                            HStack(spacing: 4) {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                    .font(.caption)
                                Text(camera.seller.ratings, format: .number)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                    }
                    
                    Divider()
                    
                    // MARK: Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .fontWeight(.bold)
                        
                        Text(camera.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    
                    // MARK: Specifications
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Specifications")
                            .fontWeight(.bold)
                        
                        HStack {
                            Text("Resolution:")
                            Spacer()
                            Text("45 MP")
                        }
                        HStack {
                            Text("ISO Range:")
                            Spacer()
                            Text("100-51200")
                        }
                        HStack {
                            Text("Weight:")
                            Spacer()
                            Text("738 g")
                        }
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Spacer(minLength: 80) // space for bottom buttons
                }
                .padding()
            }
            
            // MARK: Bottom Action Buttons
            VStack(spacing: 12) {
                
                HStack {
                    Image(camera.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    
                    // MARK: Price & Shipping
                    VStack(alignment: .leading, spacing: 8) {
                        Text(camera.price, format: .currency(code: camera.currency))
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Free insured shipping within Germany")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Condition: Excellent, like new")
                            .font(.subheadline)
                    }
                }
            
                
                HStack(spacing: 16) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Text("Suggest a price")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.black)
                            )
                    }
                    
                    Button {
                        if authentication.isLoggedIn {
                            coordinator.push(.checkout(camera))
                        } else {
                            showLogin.toggle()
                        }
                    } label: {
                        Text(authentication.isLoggedIn ? "Buy" : "Login")
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
            }
            .padding()
            .background(Color(.systemBackground))
        }
        .edgesIgnoringSafeArea(.top)
        .alert(Text("Suggest price"), isPresented: $showAlert) {
            Button("Cancel", role: .cancel) {
                // Handle the acknowledgement.
            }
            Button("OK") {
                // Handle the acknowledgement.
            }
            TextField("price", text: $suggestPrice)
                .keyboardType(.asciiCapableNumberPad)
        } message: {
            Text("Send the seller a suggestion for the price")
        }
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}
