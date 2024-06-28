//
//  FocusSessionView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 6/26/24.
//

import SwiftUI

struct FocusSessionView: View {
    let activity: Activity
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Spacer(minLength: 60.0)
                HStack {
                    Spacer(minLength: 60.0)
                    TimerCircle(percentageComplete: 0.5)
                    Spacer(minLength: 60.0)
                }
                Text("Short break, have a stretch!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding()
                IntervalView()
                
                ProminentButton("SKIP BREAK", icon: .chevron)
                    .padding(.vertical)
                Spacer()
            }
            .background(
                Image("bg_fun_01_light", bundle: nil)
                    .resizable(resizingMode: .tile)
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(activity.name).foregroundColor(.white)
                        .font(.system(size: 26))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.sbMint, for: .navigationBar)
        }
    }
}

struct TimerCircle: View {
    var percentageComplete: Double
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            let minDim = width < height ? width : height
            
            let inset = minDim * 0.1
            let strokeSize = minDim * 0.1
            let midpoint = CGPoint(x: minDim / 2.0, y: minDim / 2.0)
            let shadowRad = minDim * 0.02
            ZStack {
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
                
                VStack {
                    Text("2:48")
                        .font(.largeTitle)
                        .padding(.bottom, 5.0)
                    Text("/ 5:00")
                        .font(.title3)
                        .foregroundColor(.sbMint)
                }
                .position(midpoint)
            }
        }
    }
}

struct IntervalView: View {
    var body: some View {
        Spacer()
    }
}

#Preview {
    FocusSessionView(activity: Activity(name: "Test activity", frequency: .daily))
}
