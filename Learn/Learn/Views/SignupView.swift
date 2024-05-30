//
//  SignupView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct SignupView: View {
    
   @StateObject var viewModel = SignupViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                HeaderView(
                                backgroundColor: .yellow,
                                mainText: "Welcome",
                                subText: "Start your journey!",
                                inclineAngle :-15,
                                offset: -190
                )
                
                if !viewModel.ErrorStr.isEmpty {
                    Text(viewModel.ErrorStr).foregroundColor(.red)
                }
                
                
               
                TextField("Username", text: $viewModel.userName).padding(10).frame(width: UIScreen.main.bounds.width - 50 ,height:50)
                
                TextField("Email Id", text: $viewModel.email).padding(10).frame(width: UIScreen.main.bounds.width - 50 , height: 50)
                                                                       
                SecureField("********", text: $viewModel.password).padding(10).frame(width: UIScreen.main.bounds.width - 50 , height: 50)
                    
                    Button{
                        viewModel.Register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            Text("Register").foregroundColor(.white).bold()
                            
                        }.frame(width: UIScreen.main.bounds.width - 50 , height: 50).padding(.top, 30)
                    }
            }
        }
    }
}

#Preview {
    SignupView()
}
