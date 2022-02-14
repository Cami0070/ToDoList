//
//  Urgency.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 01.02.2022.
//

import Foundation

enum Urgency {
    case low
    case medium
    case high
    
    var description: String {
        switch self {
        case .low: return "Not urgent"
        case .medium: return "Not so urgent"
        case .high: return "Urgent"
        }
    }
}
