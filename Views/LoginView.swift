//
//  LoginView.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                VStack {
                    Text("todo mate")
                        .font(.system(size: 50))
                        .bold()
                        .padding(.bottom, 10)
                    Text("Step by step one goes a long way")
                        .font(.system(size: 20))
                        .foregroundStyle(.gray)
                }
                .padding(.top, 180)
                
                // Login Form
                Form {
                    // Show Login Error Message
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    ButtonView(title: "Log in", backgroundColor: .blue)
                    {
                        viewModel.login()
                    }
                    .padding()
                }
                
                VStack {
                    NavigationLink("Forgot password?", destination: PasswordVerificationView())
                    
                }
                .offset(y: -100)
                .font(.system(size: 18))
                
                
                // Create Account
                VStack {
                    Text("New Around Here?")
                
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.vertical, 40)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
