//
//  ContentView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.SignedIn , !viewModel.currentUserId.isEmpty {
            //Todo
            TabView{
                TodoListView(userId: viewModel.currentUserId).tabItem { Label("Home", systemImage: "house") }
                ProfileView().tabItem { Label("Profile", systemImage: "person.circle") }
            }
           
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
