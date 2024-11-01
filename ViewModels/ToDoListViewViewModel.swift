//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import FirebaseFirestore
import Foundation

// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    
    // Delete to do list item
    // - Parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
