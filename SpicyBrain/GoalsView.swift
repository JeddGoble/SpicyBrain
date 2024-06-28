//
//  ContentView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/3/24.
//

import SwiftUI

struct GoalsView: View {
    @State private var goals = Goal.preview()
    @State private var selection: String?
    
    var body: some View {
        NavigationStack {
            VStack {
                
                List(goals, id: \.name) { goal in
                    NavigationLink {
                        GoalDetailView(goal: goal)
                    } label: {
                        GoalViewCell(goal: goal)
                    }
                }
                .scrollContentBackground(.hidden)
                
                ProminentButton("ADD NEW GOAL", icon: .plus)
                Spacer()
            }
            .background(
                Image("bg_fun_02_light", bundle: nil)
                    .resizable(resizingMode: .tile)
            )
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
                GoalCellCircle(goal: $goal)
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

struct GoalCellCircle: View {
    @Binding var goal: Goal
    
    var body: some View {
        ZStack {
            ProgressCircle(percentageComplete: Double(goal.habitsCompletedToday) / Double(goal.habitsInGoal))
            Text("\(goal.habitsCompletedToday)")
                //.position(midpoint)
                .font(.title)
        }
    }
}

struct ProgressCircle: View {
    
    let percentageComplete: Double
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let minDim = width < height ? width : height
            
            let inset = minDim * 0.1
            let strokeSize = minDim * 0.1
            let midpoint = CGPoint(x: minDim / 2.0, y: minDim / 2.0)
            let shadowRad = minDim * 0.02
            
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
        }
    }
}

struct ProminentButton: View {
    
    init(_ buttonText: String, icon: Icon = .none) {
        self.buttonText = buttonText
        self.icon = icon
    }
    
    let buttonText: String
    let icon: Icon
    
    enum Icon: String {
        case none
        case plus = "plus"
        case chevron = "chevron-right"
    }
    
    var body: some View {
        HStack {
            Spacer(minLength: 40.0)
            Button {
                // TODO
            } label: {
                ZStack {
                    switch icon {
                    case .none:
                        Spacer()
                    case .plus:
                        HStack {
                            Image("plus", bundle: nil)
                                .resizable()
                                .frame(width: 32.0, height: 32.0, alignment: .leading)
                                .padding()
                            Spacer()
                        }
                    case .chevron:
                        HStack {
                            Spacer()
                            Image("chevron-right", bundle: nil)
                                .resizable()
                                .frame(width: 32.0, height: 32.0, alignment: .leading)
                                .padding()
                        }
                    }
                    
                    Text(buttonText)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.horizontal, 80.0)
                        .padding(.vertical, 40.0)
                        .foregroundColor(.white)
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.sbRed)
            .frame(height: 66.0)
            .cornerRadius(8.0)
            Spacer(minLength: 40.0)
        }
    }
}


#Preview {
    GoalsView()
}
