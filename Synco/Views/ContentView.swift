//
//  ContentView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            
            TodayView()
                .tabItem {
                    Image(systemName: "sun.max")
                    Text("Today")
                }
            
            PatternsView()
                .tabItem {
                    Image(systemName: "brain")
                    Text("Patterns")
                }
            
            AnalyticsView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Analytics")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
