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
            
            if entries.count < 3 {

                    VStack(spacing: 16) {
                        
                        Image(systemName: "brain")
                            .font(.system(size: 60))

                        Text("Learning your patterns")

                            .font(.title2)

                            .bold()

                        Text("Sync at least 3 days to unlock personal insights.")

                            .foregroundStyle(.secondary)

                            .multilineTextAlignment(.center)

                    }

                    .padding()

                    .navigationTitle("Analytics")

            } else {
                
                ScrollView {
                    
                    VStack {
                        
                        ProductivityChartView(
                            entries: entries
                        )
                        
                        ForEach(
                            PatternAnalyzer.analyze(
                                entries: entries
                            )
                        ) { insight in
                            
                            
                            InsightCard(
                                insight: insight
                            )
                            .padding(.horizontal)
                            
                        }
                    }
                }
                .navigationTitle("Analytics")
            }
        }
    }
}


#Preview {
    AnalyticsView()
}
