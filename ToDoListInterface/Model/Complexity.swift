//
//  Complexity.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 06.02.2022.
//

import Foundation

enum Complexity {
    case low
    case medium
    case high
    
    var description: String {
        switch self {
        case .low: return "Low complexity"
        case .medium: return "Medium complexity"
        case .high: return "High complexity"
        }
    }
}
