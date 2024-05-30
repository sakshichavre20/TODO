//
//  LearnApp.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI
import FirebaseCore



@main
struct LearnApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
