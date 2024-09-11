//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Chaithawat Pinsuwan on 10/9/2567 BE.
//

import Foundation
import Combine

class ToDoViewModel: ObservableObject {
    @Published var tasks: [ToDoItem] = []
    
    // Add a new task
    func addTask(title: String, description: String? = nil, priority: TaskPriority = .medium) {
        let newTask = ToDoItem(title: title, description: description, priority: priority)
        tasks.append(newTask)
    }
    
    // Toggle task completion status
    func toggleTaskCompletion(task: ToDoItem) {
        if let index = tasks.firstIndex(where: { $0.id == task.id}) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    // Remove a task
    func removeTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    // Edit a task
    func editTask(task: ToDoItem, newTitle: String, newDescription: String?, newPriority: TaskPriority) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
            tasks[index].description = newDescription
            tasks[index].priority = newPriority
        }
    }
    
}
