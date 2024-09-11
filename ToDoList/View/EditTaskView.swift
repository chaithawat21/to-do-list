//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Chaithawat Pinsuwan on 10/9/2567 BE.
//

import SwiftUI

struct EditTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ToDoViewModel
    var task: ToDoItem

    // Initialize with the task's properties
    @State private var title: String
    @State private var description: String
    @State private var selectedPriority: TaskPriority

    init(viewModel: ToDoViewModel, task: ToDoItem) {
        self.viewModel = viewModel
        self.task = task
        _title = State(initialValue: task.title)
        _description = State(initialValue: task.description ?? "")
        _selectedPriority = State(initialValue: task.priority)
    }

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
            .navigationTitle("Edit Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        // Save the edited task details back to the ViewModel
                        viewModel.editTask(task: task, newTitle: title, newDescription: description, newPriority: selectedPriority)
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
    EditTaskView(viewModel: ToDoViewModel(), task: ToDoItem(title: "Sample Task"))
}
