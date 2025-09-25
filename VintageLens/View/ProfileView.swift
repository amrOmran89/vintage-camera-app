//
//  ProfileView.swift
//  VintageLens
//
//  Created by Amr Omran on 22.09.25.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showLogin = false
    
    var body: some View {
        List {
            Section {
                HStack {
                    
                    Image(systemName: "person.circle")
                        .font(.system(size: 90))
                    
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text("Welcome!")
                        Button {
                            showLogin.toggle()
                        } label: {
                            Text("Log in or register")
                                .underline()
                        }

                    }
                    
                    Spacer()
                }
            }
            
            Section {
                Label("Buy", systemImage: "cart")
                    .padding(.bottom, 8)
                Label("Messages", systemImage: "envelope")
                    .padding(.bottom, 8)
                Label("Settings", systemImage: "gearshape")
                    .padding(.bottom, 8)
                Label("Support", systemImage: "headset")
                    .padding(.bottom, 8)
                Label("Info", systemImage: "info.circle")
                    .padding(.bottom, 8)
            }
        }
        .listStyle(.plain)
        .sheet(isPresented: $showLogin) {
            LoginView()
        }
    }
}

#Preview {
    ProfileView()
}
