//
//  ContentView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/3/24.
//

import SwiftUI

struct GoalsView: View {
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
    
    @State var goal: Goal
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                ProgressCircle(goal: $goal)
                //.frame(width: geo.size.width, height: geo.size.height)
                    .frame(width: 60.0, height: 60.0)
                    .padding(.trailing)
                VStack {
                    HStack {
                        Text(goal.name)
                            .font(.title2)
                        Spacer()
                    }
                    HStack {
                        Text("0 activities")
                            .foregroundStyle(Color.sbGrey)
                        Spacer()
                    }
                    HStack {
                        Text("\(goal.streakLength) day streak")
                            .foregroundStyle(Color.sbMint)
                        Spacer()
                    }
                }
                VStack {
                    Button {
                        print("TODO: page transition")
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

struct ProgressCircle: View {
    
    @Binding var goal: Goal
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let minDim = width < height ? width : height
            
            let inset = minDim * 0.1
            let strokeSize = minDim * 0.1
            let midpoint = CGPoint(x: minDim / 2.0, y: minDim / 2.0)
            let shadowRad = minDim * 0.02
            
            let percentageComplete = Double(goal.habitsCompletedToday) / Double(goal.habitsInGoal)
            
            Path { path in
                path.addArc(center: midpoint, radius: minDim / 2.0, startAngle: Angle.zero, endAngle: Angle(degrees: 360), clockwise: false)
            }
            .fill()
            .foregroundColor(.white)
            .shadow(color: .sbLightGrey, radius: shadowRad, x: shadowRad / 2.0, y: shadowRad / 2.0)
            
            Path { path in
                path.addArc(center: midpoint, radius: minDim / 2.0 - inset, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: percentageComplete * 360 - 90), clockwise: false)
            }
            .stroke(lineWidth: strokeSize)
            .foregroundColor(.sbMint)
            
            Path { path in
                path.addArc(center: midpoint, radius: minDim / 2.0 - inset, startAngle: Angle(degrees: percentageComplete * 360 - 90), endAngle: Angle(degrees: -90), clockwise: false)
            }
            .stroke(lineWidth: strokeSize)
            .foregroundColor(.sbLightGrey)
            Text("\(goal.habitsCompletedToday)")
                .position(midpoint)
                .font(.title)
        }
    }
}



#Preview {
    GoalsView()
}