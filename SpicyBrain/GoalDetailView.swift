//
//  GoalHabitsView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 6/23/24.
//

import SwiftUI

struct GoalDetailView: View {
    let goal: Goal
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let activities = goal.activities {
                    List(activities, id: \.name) { activity in
                        NavigationLink {
                            FocusSessionView(activity: activity)
                        } label: {
                            ActivityViewCell(activity: activity)
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
                ProminentButton("ADD ACTIVITY", icon: .plus)
                Spacer()
            }
            .background(
                Image("bg_fun_02_light", bundle: nil)
                    .resizable(resizingMode: .tile)
                    .ignoresSafeArea()
                )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(goal.name).foregroundColor(.white)
                        .font(.system(size: 26))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.sbMint, for: .navigationBar)
        }
    }
}

struct SummaryCell: View {
    
    @State var goal: Goal
    
    var body: some View {
        Spacer()
    }
}

struct ActivityViewCell: View {
    
    @State var activity: Activity
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                ActivityCellCircle(activity: $activity)
                    .frame(width: 40.0, height: 40.0)
                    .padding(.trailing)
                VStack {
                    HStack {
                        Text(activity.name)
                            .font(.title2)
                        Spacer()
                    }
                    HStack {
                        Text(activity.summary)
                            .foregroundStyle(Color.sbMint)
                        Spacer()
                    }
                }
                VStack {
                    Button {
                        print("TODO: Quick settings")
                    } label: {
                        Image("more", bundle: nil)
                            .resizable()
                            .frame(width: 35, height: 35, alignment: .center)
                    }
                }
            }
            Spacer()
        }
    }
}

struct ActivityCellCircle: View {
    @Binding var activity: Activity
    
    var body: some View {
        if let timeToday = activity.timeToday, let dailyTimeGoal = activity.dailyTimeGoal {
            ProgressCircle(percentageComplete: timeToday / dailyTimeGoal)
        } else {
            ProgressCircle(percentageComplete: 0.0)
        }
    }
}



#Preview {
    GoalDetailView(goal: Goal.preview().first != nil ? Goal.preview().first! : Goal(name: "Test"))
}
