//
//  ContentView.swift
//  Sprintify
//
//  Created by Akarsh Gharge on 2025-01-10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            GoalListView(goalType: "Daily")
                .tabItem {
                    Label("Daily", systemImage: "sun.max")
                }
            GoalListView(goalType: "Weekly")
                .tabItem {
                    Label("Weekly", systemImage: "calendar")
                }
            GoalListView(goalType: "Monthly")
                .tabItem {
                    Label("Monthly", systemImage: "calendar")
                }
            GoalListView(goalType: "Yearly")
                .tabItem {
                    Label("Yearly", systemImage: "calendar")
                }
        }
    }
}
