//
//  ContentView.swift
//  ToDoList
//
//  Created by Chaithawat Pinsuwan on 10/9/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var showingAddTask = false
    @State private var selectedTask: ToDoItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.tasks) { task in
                    HStack {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isCompleted ? .green : .gray)
                            .scaleEffect(task.isCompleted ? 1.2 : 1)
                            .animation(.spring(), value: task.isCompleted)
                            .onTapGesture {
                                viewModel.toggleTaskCompletion(task: task)
                            }
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                            Text(task.priority.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Button("Edit") {
                            selectedTask = task
                        }
                    }
                }
                .onDelete(perform: viewModel.removeTask)
            }
            .navigationTitle("To Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTask = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTask) {
                AddTaskView(viewModel: viewModel)
            }
            .sheet(item: $selectedTask) { task in
                EditTaskView(viewModel: viewModel, task: task)
            }
        }
    }
}

#Preview {
    ContentView()
}
