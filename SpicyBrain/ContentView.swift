//
//  ContentView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var goals = Goal.preview()
    
    var body: some View {
        NavigationStack {
            List(goals, id: \.name) { goal in
                GoalViewCell(goal: goal)
            }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Goals").foregroundColor(.white)
                            .font(.system(size: 26))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.sbMint, for: .navigationBar)
               
            }
    }
}

struct GoalViewCell: View {
    
    var goal: Goal
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                VStack {
                    HStack {
                        Text(goal.name)
                            .font(.title2)
                        Spacer()
                    }
                    HStack {
                        Text("0 activities")
                            .foregroundStyle(Color.sbLightGrey)
                        Spacer()
                    }
                    HStack {
                        Text("\(goal.streakLength) day streak")
                            .foregroundStyle(Color.sbMint)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
