//
//  ToDoListInterfaceApp.swift
//  ToDoListInterface
//
//  Created by Camelia Braghes on 18.01.2022.
//

import SwiftUI

@main
struct ToDoListInterfaceApp: App {

    @StateObject var todoManager = TodoListManager.fullState()
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
