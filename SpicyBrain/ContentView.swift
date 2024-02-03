//
//  ContentView.swift
//  SpicyBrain
//
//  Created by Jedd Goble on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
                Form {
                    Section {
                        Text("Make this app")
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
