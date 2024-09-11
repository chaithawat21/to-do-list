//
//  AddTaskView.swift
//  ToDoList
//
//  Created by Chaithawat Pinsuwan on 10/9/2567 BE.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ToDoViewModel
    @State private var title = ""
    @State private var description = ""
    @State private var selectedPriority: TaskPriority = .medium
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $title)
                TextField("Description", text: $description)
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(TaskPriority.allCases) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.addTask(title: title, description: description, priority: selectedPriority)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddTaskView(viewModel: ToDoViewModel())
}
