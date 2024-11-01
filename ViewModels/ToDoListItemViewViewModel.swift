//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Richard Kim on 12/10/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

// ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone) // if it is done originally is ture is false, false is true
        // so everytime if tabs the button, it changes the state
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDIctionary())
    }
}
