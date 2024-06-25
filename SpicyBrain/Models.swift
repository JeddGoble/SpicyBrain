//
//  Models.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/16/24.
//

import Foundation

struct Goal: Identifiable {
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
        return [Goal(name: "Example thing 1"),
                Goal(name: "Example 2")]
    }
}

struct Activity: Identifiable {
    let id = UUID()
    var name: String
}

struct GoalHistory {
    let date = Date()
    var timeSpent: TimeInterval
}
