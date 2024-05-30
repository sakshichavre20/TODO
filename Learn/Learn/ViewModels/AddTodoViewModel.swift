//
//  AddTodoViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseAuth
import FirebaseFirestore

import Foundation
class AddTodoViewModel : ObservableObject {
    
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    func save(){
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let newId = UUID().uuidString
        
        let newItem = Todo(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970 , createdDate: Date().timeIntervalSince1970, isDone:false)
        
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uId).collection("todos").document(newId).setData(newItem.asDict())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
