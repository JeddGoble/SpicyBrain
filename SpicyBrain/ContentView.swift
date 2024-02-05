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
                VStack {
                    Spacer()
                    HStack{
                        VStack {
                            Text(goal.name)
                                .bold()
                            Text("0 tasks")
                            Text("\(goal.streakLength) days")
                        }
                    }
                    Spacer()
                }
                
                    }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Goals").foregroundColor(.white)
                            .font(.system(size: 26))
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color(red: 0.18, green: 0.76, blue: 0.71), for: .navigationBar)
               
            }
    }
}

#Preview {
    ContentView()
}
