//
//  TodoListView.swift
//  Learn
//
//  Created by Sakshi Chavre on 27/05/24.
//
import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel: TodoListViewModel
    @FirestoreQuery var items: [Todo]
    
    
    init(userId: String){
       
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: TodoListViewModel(userId: userId ))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TodoItemView(item:item).swipeActions{
                        Button("Delete"){
                            viewModel.delete(id: item.id)
                            
                        }.tint(.red)
                    }
                    
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("ToDo's").toolbar{
                Button{
                    viewModel.showNewItemView = true
                   
                } label: {
                    Image(systemName: "plus")
                }
                
            }.sheet(isPresented: $viewModel.showNewItemView){
                AddTodoView(newItemPresented: $viewModel.showNewItemView)
            }
        }
    }
}

#Preview {
    TodoListView(userId: "Jc7Rb3JZgVhgUjKuLokmfvnIc4i1")
}
