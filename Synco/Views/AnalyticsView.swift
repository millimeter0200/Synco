//
//  Analyticsview.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI
import SwiftData


struct AnalyticsView: View {
    
    
    @Query private var entries: [DailyEntry]
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 20) {
                
                Image(systemName: "brain")
                    .font(.system(size: 60))
                
                
                Text(
                    PatternAnalyzer.analyze(
                        entries: entries
                    )
                )
                .multilineTextAlignment(.center)
                .padding()
                
            }
            .navigationTitle("Analytics")
        }
    }
}


#Preview {
    AnalyticsView()
}
