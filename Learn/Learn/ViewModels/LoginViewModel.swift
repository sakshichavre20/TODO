//
//  LoginViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseAuth
import Foundation

class LoginViewModel : ObservableObject {
    @Published  var Email=""
    @Published  var Password=""
    @Published  var ErrorStr=""
    init(){
      
    }
    
    func Login(){
        guard Validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: Email, password: Password)
    }
    
    func Validate() -> Bool {
        guard !Email.trimmingCharacters(in: .whitespaces).isEmpty, !Password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            ErrorStr = "Please Fill in all the details"
            return false
        }
        
        guard Email.contains("@") && Email.contains(".") else{
            ErrorStr = "Enter a valid email id"
            return false
        }
        
     return true
    }
}
