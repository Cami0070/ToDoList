//
//  ToDoItem.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 01.02.2022.
//

import Foundation
import UIKit

struct ToDoItem: Identifiable {
    
    var id: UUID
    
    // always set by the initializer with the current date
    var creationDate: Date
    
    /// Whether the item has been completed or not.
    /// Always set to `false` when initialized.
    var completed: Bool
    
    ///name of the task
    var name: String
    /// 
    var type: TaskType
    var urgency: Urgency
    var note: String?
    
    /// The steps required to finish the action. Available only for `project` type items.
    var steps: [String]
    
    /// The complexity of the task. Available only for `project` type items.
    var complexity: Complexity?

    init(name: String, type: TaskType, urgency: Urgency, note: String?,
         steps: [String] = [],
         complexity: Complexity? = nil) {
        // Always the same initial values defined in the initializer.
        self.completed = false
        self.creationDate = Date.now
        self.id = UUID()
        
        self.name = name
        self.type = type
        self.urgency = urgency
        self.note = note
        
        self.steps = steps
        self.complexity = complexity
    }
}
