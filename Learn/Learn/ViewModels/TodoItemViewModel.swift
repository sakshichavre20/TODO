//
//  TodoItemViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class TodoItemViewModel : ObservableObject {
    init(){}
    
   
    
    func toggleIsDone(item: Todo){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
  
    
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
    
        let db = Firestore.firestore()
    
        db.collection("users").document(uid).collection("todos").document(itemCopy.id).setData(itemCopy.asDict())
        
    }
}
