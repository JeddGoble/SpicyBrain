//
//  GoalViewCell.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/4/24.
//

import SwiftUI

struct GoalViewCell: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Goal: Identifiable {
    var name: String
    var tasks: [Task]?
    var streakLength: Int = 0
    let id = UUID()
    
    static func preview() -> [Goal] {
        return [Goal(name: "Make this app", streakLength: 2),
                Goal(name: "Get in shape")]
    }
}

struct Task { // placeholder
    var name: String
}

#Preview {
    GoalViewCell()
        .frame(height: 100)
        .border(.black)
}
