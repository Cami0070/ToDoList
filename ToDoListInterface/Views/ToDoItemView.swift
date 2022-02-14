//
//  ToDoItemView.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 06.02.2022.
//

import SwiftUI

struct ToDoItemView: View {
    
    var viewModel: ToDoItemViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.title)
                
                if viewModel.isProject {
                    additionalProjectView
                }
                    
                Spacer()
                
                Image(uiImage: viewModel.urgencyIcon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .padding()
               
                }
            }
        }
    
    
    var additionalProjectView: some View {
        HStack {
            Text("(\(viewModel.stepsCount) steps)")
                .foregroundColor(Color.gray)
                .font(Font.footnote.weight(.medium))
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(viewModel: ToDoItemViewModel(item: ToDoItem(name: "Jump around", type: .simpleTask, urgency: .high, note: "Just do a couple jumps")))
        ToDoItemView(viewModel: ToDoItemViewModel(item: ToDoItem(name: "Develop a TODO list app", type: .project, urgency: .low, note: nil, steps: ["Define features and behaviour", "Decide on a design", "Define architecture", "Develop application", "Upload to GitHub"], complexity: .medium)))
        
    }
}
