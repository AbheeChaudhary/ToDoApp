//start
//  ContentView.swift
//  ToDoApp
//
//  Created by Abhee Chaudhary on 28/10/24.
//

import SwiftData
import SwiftUI

@MainActor
struct ContentView: View {
    @Environment(\.modelContext) private var context  // Access SwiftData context
    @Query private var tasks: [Task]  // Fetch all tasks from storage

    @State private var newTaskTitle = ""  // Store new task title input

    var body: some View {
        VStack {
            // App Header
            Text("To-Do List")
                .font(.largeTitle)
                .padding()

            // List of tasks
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)  // Show the task title
                        Spacer();
                        Toggle(
                            "",
                            isOn: Binding(
                                get: { task.isCompleted },
                                set: { newValue in
                                    task.isCompleted = newValue
                                    try? context.save()  // Save changes to storage
                                }
                            )
                        )
                        .labelsHidden()
                    }
                }
                .onDelete(perform: deleteTask)  // Enable task deletion
            }

            // Add New Task Section
            HStack {
                TextField("New Task", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)
                    .frame(maxWidth: .infinity)

                Button("Add") {
                    addTask()  // Add the new task
                }
                .buttonStyle(.borderedProminent)
                .padding(.leading)
            }
            .padding()
        }
        .padding()
    }

    // Function to add a new task
    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }  // Ensure input isn't empty
        let newTask = Task(title: newTaskTitle)  // Create a new Task object
        context.insert(newTask)  // Insert the new task into SwiftData
        try? context.save()  // Save the task to storage
        newTaskTitle = ""  // Clear the input field
    }

    // Function to delete tasks
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            context.delete(tasks[index])  // Delete the selected task
        }
        try? context.save()  // Save the deletion
    }
}

#Preview {
    ContentView()
}
