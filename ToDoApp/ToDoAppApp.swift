//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Abhee Chaudhary on 28/10/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self);// register task model
        }
    }
}
