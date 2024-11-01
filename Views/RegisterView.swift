//
//  RegisterView.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            Text("Registration")
                .font(.system(size: 20))
                .bold()
                
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                ButtonView(title: "Create Account", backgroundColor: .green) {
                    // Attempt registration
                    if viewModel.validate() {
                        viewModel.register()
                    }
                    else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),message: Text("Please fill in all the required fields"))
            }
        }
        
        Spacer()
    }
    
}

#Preview {
    RegisterView()
}
