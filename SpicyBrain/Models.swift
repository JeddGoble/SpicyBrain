//
//  Models.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/16/24.
//

import Foundation

struct Goal: Identifiable, Hashable {
    
    static func == (lhs: Goal, rhs: Goal) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id = UUID()
    
    var name: String
    var activities: [Activity]?
    var history: [GoalHistory]?
    var streakLength: Int {
        return Int.random(in: 0...14) // TEMP
    }
    var habitsCompletedToday: Int {
        return Int.random(in: 1...3) // TEMP
    }
    var habitsInGoal: Int {
        return 3 // TEMP
    }
    
    static func preview() -> [Goal] {
        return [Goal(name: "Learn to play guitar", activities:
                        [Activity(name: "Practice tabs", dailyTimeGoal: 1800.0, timeToday: 600.0, frequency: .weekdays),
                         Activity(name: "Listen to the greats", dailyTimeGoal: 900.0, timeToday: 0.0, frequency: .daily),
                         Activity(name: "Work on my song", dailyTimeGoal: 3600.0, timeToday: 1800.0, frequency: .weekly)
                        ]),
                Goal(name: "Example 2")]
    }
}

struct Activity: Identifiable {
    let id = UUID()
    var name: String
    
    var dailyTimeGoal: TimeInterval?
    var timeToday: TimeInterval?
    var frequency: Frequency
    
    var summary: String {
        var details = frequency.rawValue + " task"
        if let dailyTimeGoal = dailyTimeGoal {
            let mins = Int(dailyTimeGoal / 60.0)
            details += ", \(mins) minutes"
        }
        return details
    }
    
    enum Frequency: String { // Placeholder
        case daily = "Daily"
        case weekdays = "Weekday"
        case weekly = "Weekly"
    }
}

struct GoalHistory {
    let date = Date()
    var timeSpent: TimeInterval
}
