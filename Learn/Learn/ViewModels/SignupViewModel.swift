//
//  SignupViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseAuth
import Foundation
import FirebaseFirestore

class SignupViewModel : ObservableObject {
    
     @Published var userName = ""
     @Published var email = ""
     @Published var password = ""
     @Published var ErrorStr = ""
    
    init(){}
    
    func Register(){
        guard Validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self ]result , error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
        
        
    }
    
    private func insertUserRecord(id : String){
        let newUser = User(id : id, name: userName, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDict())
        
    }
    
    func Validate() -> Bool {
        
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty , !password.trimmingCharacters(in: .whitespaces).isEmpty  else {
            
            ErrorStr = "Please Fill in all the details"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            ErrorStr = "Enter a valid email id"
            return false
        }
        
        guard password.count >= 6 else{
            ErrorStr = "Password must contain minimum 6 characters"
            return false
        }
        
     return true
    }
}
