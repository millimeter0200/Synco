//
//  TodayView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("How was your day?")
                    .font(.largeTitle)
                    .bold()
                
                
                Text("Let's discover your patterns.")
                    .foregroundStyle(.secondary)
                
            }
            .navigationTitle("Today")
        }
    }
}

#Preview {
    TodayView()
}
