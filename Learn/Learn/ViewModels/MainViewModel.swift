//
//  MainViewModel.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseAuth
import Foundation

class MainViewModel : ObservableObject {
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in  DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""
        }
        }
    }
    
    public var SignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
