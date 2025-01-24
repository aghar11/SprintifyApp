//
//  GoalViewModel.swift
//  Sprintify
//
//  Created by Akarsh Gharge on 2025-01-20.
//

import Foundation
import SwiftData

struct Goal: Identifiable {
    let id = UUID()
    var title: String
    var deadline: Date
    var notes: String = ""
    var isCompleted: Bool = false
}

final class GoalViewModel: ObservableObject {
    @Published var dailyGoals: [Goal] = []
    @Published var weeklyGoals: [Goal] = []
    @Published var monthlyGoals: [Goal] = []
    @Published var yearlyGoals: [Goal] = []
}
