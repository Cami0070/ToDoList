//
//  ContentView.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 18.01.2022.
//

import SwiftUI

struct TodoListView : View {
    
    @ObservedObject var todoManager: TodoListManager
    @State var shouldPresentAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                itemsListView
                if todoManager.itemViewModels.count == 0 {
                    Text ("Please, start by adding items")
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    EditButton()
                    Button( action: {
                        shouldPresentAlert = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }
    }
    
    var itemsListView: some View {
        List {
            ForEach(todoManager.itemViewModels) { viewModel in
                if (viewModel.isProject) {
                    NavigationLink(
                        destination: ProjectView(viewModel: viewModel),
                        label: {
                            ToDoItemView(viewModel: viewModel)
                        })
                } else {
                    ToDoItemView(viewModel: viewModel)
                }
            }
            .onDelete(perform: { indexSet in
                todoManager.delete(at: indexSet)
                
            })
            .onMove(perform: { indices, newOffset in
                todoManager.move(indices: indices, newOffset: newOffset)
            })
        }
        .alert(isPresented: $shouldPresentAlert, content: {
            Alert(title: Text("What type of item do you want to add?"), primaryButton: .default(Text("Simple task"), action: {
                // TODO: navigate to AddSimpleTaskView
            }), secondaryButton: .default(Text("Project"), action: {
                // TODO: navigate to AddProjectView
            })
            )
        })
    }
}
    
struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: TodoListManager.fullState())
    }
}

