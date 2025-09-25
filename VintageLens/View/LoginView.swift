//
//  LoginView.swift
//  VintageLens
//
//  Created by Amr Omran on 25.09.25.
//


import SwiftUI
import AuthenticationServices

struct LoginView: View {
    
    @Environment(AuthenticationService.self) var authService
    @Environment(\.dismiss) var dismiss
    
    @State private var emailOrPhone: String = ""
    @State private var password: String = ""
    @State private var isSecure: Bool = true

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Title
            Text("Welcome Back")
                .font(.largeTitle.bold())
                .padding(.bottom, 8)
            
            Text("Sign in to continue")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            // Email or phone
            TextField("Email address or phone number", text: $emailOrPhone)
                .keyboardType(.emailAddress)
                .textContentType(.username)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            
            // Password
            Group {
                if isSecure {
                    SecureField("Password", text: $password)
                } else {
                    TextField("Password", text: $password)
                }
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .overlay(
                HStack {
                    Spacer()
                    Button(action: { isSecure.toggle() }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing, 12)
                }
            )
            
            Button(action: handleEmailLogin) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.top, 8)
            
            HStack {
                Rectangle().frame(height: 1).foregroundColor(.secondary.opacity(0.3))
                Text("or")
                    .foregroundColor(.secondary)
                Rectangle().frame(height: 1).foregroundColor(.secondary.opacity(0.3))
            }
            .padding(.vertical, 8)
            
            // Google sign-in
            Button(action: handleGoogleLogin) {
                HStack {
                    Image("google_logo") // place a 24x24 Google icon in Assets
                        .resizable().frame(width: 24, height: 24)
                    Text("Continue with Google")
                        .foregroundColor(.primary)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
            }
            
            // Apple sign-in
            SignInWithAppleButton(.signIn) { request in
                // configure your Apple request
                authService.isLoggedIn = true
                dismiss()
            } onCompletion: { result in
                // handle the result
            }
            .signInWithAppleButtonStyle(.black)
            .frame(height: 50)
            .cornerRadius(12)
            
            Spacer()
            
            Button("Forgot password?") {
                // handle password reset
            }
            .font(.footnote)
            .foregroundColor(.blue)
        }
        .padding(.horizontal, 24)
    }
    
    // MARK: - Actions
    private func handleEmailLogin() {
        // validate email/phone and password, then call your API
        authService.isLoggedIn = true
        dismiss()
    }
    
    private func handleGoogleLogin() {
        // integrate GoogleSignIn SDK here
        authService.isLoggedIn = true
        dismiss()
    }
}

#Preview {
    LoginView()
        .environment(AuthenticationService())
}
