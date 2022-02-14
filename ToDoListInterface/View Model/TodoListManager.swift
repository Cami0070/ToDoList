//
//  TodoListManager.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 24.01.2022.
//

import Foundation
import SwiftUI

class TodoListManager: ObservableObject {
    
    private var items: [ToDoItem] = [] {
        didSet {
            self.itemViewModels = items.map { item in
                ToDoItemViewModel(item: item)
            }
        }
    }
    
    // notifica toate locurile unde este fosoit in View cu noua modificare
    @Published var itemViewModels: [ToDoItemViewModel] = []
    
    init(isForTest: Bool = false) {
        
        if isForTest {
            // get my data and set to my items array
        }
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func createSimpleTask(name: String, urgency: Urgency, note: String?) {
        let newTask = ToDoItem(name: name, type: .simpleTask, urgency: urgency, note: note)
        items.append(newTask)
    }
    
    func createProject(name: String, urgency: Urgency, note: String?, steps: [String], complexity: Complexity) {
        let newProject = ToDoItem(name: name, type: .project, urgency: urgency, note: note, steps: steps, complexity: complexity)
        items.append(newProject)
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
              items.remove(at: index)
        }
    }
    
    static func emptyState() -> TodoListManager {
        let manager = TodoListManager(isForTest: true)
        
        manager.items = []
        return manager
    }

    static func fullState() -> TodoListManager {
        let manager = TodoListManager(isForTest: true)
        
        manager.items = [
            ToDoItem(name: "Clean your room", type: .simpleTask, urgency: .medium, note: nil),
            ToDoItem(name: "Prepare dinner", type: .simpleTask, urgency: .medium, note: "Chicken pasta. Buy some wine."),
            ToDoItem(name: "Take documents to the bank", type: .simpleTask, urgency: .high, note: nil),
            ToDoItem(name: "Develop a TODO list app", type: .project, urgency: .low, note: nil, steps: ["Define features and behaviour", "Decide on a design", "Define architecture", "Develop application", "Upload to GitHub"], complexity: .high),
        ]
        return manager
    }
}

