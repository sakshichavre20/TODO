//
//  ProfileView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    Image(systemName:"person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(width: 125, height:125 ).padding()
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("Name: ")
                            Text(user.name)
                        }.padding()
                        HStack{
                            Text("Email: ")
                            Text(user.email)
                        }.padding()
                        HStack{
                            Text("Joined On: ")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
                        
                    }.padding()
                    
                    Spacer()
                    
                    Button {
                        viewModel.Logout()
                       
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            Text("Logout").foregroundColor(.white).bold()
                            
                        }.padding().frame(width: 200, height:70)
                    }
                }else{
                    Text("Loading")
                }
                
                
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.FetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
