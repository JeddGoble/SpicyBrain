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
    
    static func preview() -> [Goal] {
        return [Goal(name: "Make this app"),
                Goal(name: "Get in shape")]
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
