//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var showAlert = false
    
    init() {}
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDIctionary())
    }
   
    func validate() -> Bool {
        if validateRequiredFields() && validateEmail() && validatePassword() {
            return true
        }
        else {
            return false
        }
    }
    func validateRequiredFields() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
    
    func validateEmail() -> Bool {
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        return true
    }
    
    func validatePassword() -> Bool {
        guard password.count >= 6 else {
            return false
        }
        return true
    }
    
}
