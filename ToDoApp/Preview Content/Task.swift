// Setting up "Task Model"


//  Task.swift
//  ToDoApp
//
//  Created by Abhee Chaudhary on 28/10/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var id: UUID; // generates a unique ID for each task(which is our object as it is the task in the todolist)
    var title: String;// titles the task
    var isCompleted: Bool = false;// tell is the task is completed or not default value is false

    init(title: String) {// when initialised the task is not completed
        self.id = UUID();
        self.title = title;
        
    }
}
