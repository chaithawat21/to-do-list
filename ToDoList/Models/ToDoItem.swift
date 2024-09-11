//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Chaithawat Pinsuwan on 10/9/2567 BE.
//

import Foundation

enum TaskPriority: String, CaseIterable, Identifiable {
    case low = "Low"
    case medium = "Medium"
    case high = "High"
    
    var id: String {self.rawValue}
}


// Task Model
struct ToDoItem: Identifiable {
    let id = UUID()
    var title: String
    var description: String?
    var isCompleted: Bool = false
    var priority: TaskPriority = .medium
}
