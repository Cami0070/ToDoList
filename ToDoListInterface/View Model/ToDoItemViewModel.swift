//
//  ToDoItemViewModel.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 06.02.2022.
//

import Foundation
import SwiftUI

struct ToDoItemViewModel: Identifiable {
    internal var id: UUID {
        return item.id
    }
    
    private var item: ToDoItem
    
    init(item: ToDoItem) {
        self.item = item
    }
    
    // computed property - a property that is executing a piece of code and calculating a value every time it is called.
    var title: String {
        return item.name.capitalized
    }
    
    var urgencyIcon: UIImage {
        switch item.urgency {
        case .low:
            return UIImage(named: "urgency-low")!
        case .medium:
            return UIImage(named: "urgency-medium")!
        case .high:
            return UIImage(named: "urgency-high")!
        }
    }
    
    var isProject: Bool {
        item.type == .project
    }
    
    var complexityIcon: UIImage? {
        switch item.complexity {
        case .low:
            return UIImage(named: "low-complexity")
        case .medium:
            return UIImage(named: "medium-complexity")
        case .high:
            return UIImage(named: "high-complexity")
        case .none:
            return nil
        }
    }
    
    var complexityColor: Color {
        switch item.complexity {
        case .low:
            return Color.green
        case .medium:
            return Color.yellow
        case .high:
            return Color.red
        case .none:
            return Color.green
            
        }
    }
    
    var complexityDescription: String? {
        item.complexity?.description
    }
    
    var stepsCount: Int {
        return item.steps.count
    }
    
    var stepViewModels: [StepViewModel] {
        return item.steps.map { step in
            StepViewModel(step)
        }
    }
        
}

struct StepViewModel: Identifiable {
    var id: String
    var title: String
    
    init(_ title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
