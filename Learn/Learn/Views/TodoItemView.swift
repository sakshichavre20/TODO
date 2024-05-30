//
//  TodoItemView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//

import SwiftUI

struct TodoItemView: View {
    let item: Todo
    @StateObject var viewModel = TodoItemViewModel()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.body).bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(.gray)
            }
            
            Spacer()
            
            Button {
               
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName : item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

#Preview {
    TodoItemView(item: .init(id: "123", title: "title", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
