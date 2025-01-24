//
//  SprintifyApp.swift
//  Sprintify
//
//  Created by Akarsh Gharge on 2025-01-10.
//

import SwiftUI
import SwiftData

@main
struct SprintifyApp: App {
    var body: some Scene {
        let viewModel = GoalViewModel()
        
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
