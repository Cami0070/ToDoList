//
//  ProjectView.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 12.02.2022.
//

import SwiftUI

struct ProjectView: View {
    
    var viewModel: ToDoItemViewModel
    
    var body: some View {
        UITableView.appearance().backgroundColor = .clear
        
        return VStack{
            Text(viewModel.title)
                .font(.title3.bold())
                .padding()
            List {
                ForEach(viewModel.stepViewModels) { step in
                    HStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(viewModel.complexityColor)
                            .frame(width: 8, height: 8)
                        Text(step.title)
                    }
                }
            }
            if let complexityDescription = viewModel.complexityDescription {
                Text(complexityDescription)
                    .foregroundColor(viewModel.complexityColor)
            }
            if let complexityIcon = viewModel.complexityIcon {
                Image(uiImage: complexityIcon)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                
            }
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(viewModel: ToDoItemViewModel(item: ToDoItem(name: "Develop a TODO list app", type: .project, urgency: .low, note: nil, steps: ["Define features and behaviour", "Decide on a design", "Define architecture", "Develop application", "Upload to GitHub"], complexity: .low)))
    }
}
