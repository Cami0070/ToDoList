//
//  AddSimpleTaskView.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 13.02.2022.
//

import SwiftUI

struct AddSimpleTaskView: View {
    
    var toDoManager: TodoListManager
    
    @State private var title: String = ""
    @State private var note: String = ""
    @State private var urgency: Urgency = .medium
    
    var body: some View {
    VStack{
        Text("New Task")
            .padding(30)
            .foregroundColor(.gray)
        
        TextField("Title", text: $title)
            .padding()
        
        TextField("Note", text: $note)
            .padding()
    
        Text("Urgency")
            .foregroundColor(.gray)
        
        HStack{
            Button {
                urgency = .low
            } label: {
                Text("low")
                    .padding()
            }
            Button {
                urgency = .medium
            } label: {
                Text("medium")
                    .padding()
            }
            Button {
                urgency = .high
            } label: {
                Text("high")
                    .padding()
            }
        }

        Spacer()
        
        Button {
            if title.isEmpty {
                // TODO: Show an Alert for missing information
                return
            }
            let finalNote: String? = note.isEmpty ? nil : note
            toDoManager.createSimpleTask(name: title, urgency: urgency, note: finalNote)
            } label: {
                Image(systemName: "plus")
            }
        }
    }
}

struct AddSimpleTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddSimpleTaskView(toDoManager: TodoListManager())
    }
}
