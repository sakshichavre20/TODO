//
//  LoginView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI



struct LoginView: View {
    
  @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
           
      
        VStack{
            HeaderView(backgroundColor: .blue,
                       mainText: "TODO",
                       subText: "Get Things Done!",
                       inclineAngle :15,
                       offset: -100
                )
            
            if !viewModel.ErrorStr.isEmpty {
                Text(viewModel.ErrorStr).foregroundColor(.red)
            }
            
            Form {
                TextField("Email Id", text: $viewModel.Email).padding(.top, 30)
                                                                   
                SecureField("********", text: $viewModel.Password).padding(.top, 30)
                
                Button{
                    viewModel.Login()
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        Text("Login").foregroundColor(.white).bold()
                        
                    }
                }
                                                                   
            }
            
            HStack{
                Text("New User?")
                NavigationLink("Register", destination:     SignupView())
               
            }
            
        Spacer()
        }
    }
    }
}

#Preview {
    LoginView()
}
