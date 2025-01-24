//
//  GoalListView.swift
//  Sprintify
//
//  Created by Akarsh Gharge on 2025-01-23.
//

import SwiftUI

struct GoalListView: View {
    @EnvironmentObject var viewModel: GoalViewModel
    let goalType: String
    
    @State private var newGoal = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(goals(for: goalType)) {
                        goal in Text(goal.title)
                    }
                    .onDelete(perform: { indexSet in deleteGoals(at: indexSet, for: goalType)})
                }
#if os(iOS)
                .listStyle(InsetGroupedListStyle())
#elseif os(macOS)
                .listStyle(PlainListStyle())
#endif
            }
        }
    }
    
    private func goals(for type: String) -> [Goal] {
        switch type {
        case "Daily": return viewModel.dailyGoals
        case "Weekly": return viewModel.weeklyGoals
        case "Monthly": return viewModel.monthlyGoals
        case "Yearly": return viewModel.yearlyGoals
        default: return []
        }
    }
    
    private func AddGoal(for type: String, title: String) {
        guard !title.isEmpty else { return }
        let calendar = Calendar.current
        let currentDate = Date()
        switch type {
        case "Daily":
            let startOfDay = calendar.startOfDay(for: currentDate)
            let endOfDay = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfDay)

            let goal = Goal(title: title, deadline: endOfDay!)
            viewModel.dailyGoals.append(goal)
        case "Weekly":
            let upcomingSunday = calendar.nextDate(after: Date(), matching: DateComponents(weekday: 1), matchingPolicy: .nextTime)
            let startOfUpcomingSunday = calendar.startOfDay(for: upcomingSunday!) as Date?
            let endOfUpcomingSunday = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfUpcomingSunday!)
            
            let goal = Goal(title: title, deadline: endOfUpcomingSunday!)
            viewModel.weeklyGoals.append(goal)
        case "Monthly":
            let range = calendar.range(of: .day, in: .month, for: currentDate)
            let lastDayOfMonth = calendar.date(bySetting: .day, value: range!.upperBound - 1, of: currentDate)
            let startOfLastDayOfMonth = calendar.startOfDay(for: lastDayOfMonth!) as Date?
            let endOfLastDayOfMonth = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfLastDayOfMonth!)
            
            let goal = Goal(title: title, deadline: endOfLastDayOfMonth!)
            viewModel.monthlyGoals.append(goal)
        case "Yearly":
            let lastDayOfYear = calendar.date(from: DateComponents(year: calendar.component(.year, from: currentDate), month: 12, day: 31))
            let startOfLastDayOfYear = calendar.startOfDay(for: lastDayOfYear!) as Date?
            let endOfLastDayOfYear = calendar.date(byAdding: DateComponents(day: 1, second: -1), to: startOfLastDayOfYear!)
            
            let goal = Goal(title: title, deadline: endOfLastDayOfYear!)
            viewModel.yearlyGoals.append(goal)
        default: break
        }
    }
    
    private func deleteGoals(at offsets: IndexSet, for type: String) {
        switch type {
        case "Daily": return viewModel.dailyGoals.remove(atOffsets: offsets)
        case "Weekly": return viewModel.weeklyGoals.remove(atOffsets: offsets)
        case "Monthly": return viewModel.monthlyGoals.remove(atOffsets: offsets)
        case "Yearly": return viewModel.yearlyGoals.remove(atOffsets: offsets)
        default: break
        }
    }
}
