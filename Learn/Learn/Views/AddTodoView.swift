//
//  AddTodoView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct AddTodoView: View {
    @StateObject var viewModel = AddTodoViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("Add TODO").font(.system(size: 32)).bold().textFieldStyle(DefaultTextFieldStyle()).padding(.top, 100)
            
            Form{
                TextField("Title",text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle( GraphicalDatePickerStyle())
                Button{
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                 
                }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        Text("Save").foregroundColor(.white).bold()
                        
                    }.frame(width: UIScreen.main.bounds.width - 50 , height: 50).padding(.top, 30)
                }
                
            }
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title : Text("Error"), message: Text("Please fill in all the details"))
        }
    }
}

#Preview {
    AddTodoView(newItemPresented: Binding  (get: {
        return true
    } , set: {
        _ in
    }))
}
