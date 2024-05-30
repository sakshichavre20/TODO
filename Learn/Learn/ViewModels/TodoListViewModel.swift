//
//  TodoListViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseFirestore
import Foundation
class TodoListViewModel : ObservableObject {
    @Published var showNewItemView = false
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
