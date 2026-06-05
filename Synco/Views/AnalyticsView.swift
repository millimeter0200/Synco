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
            
            ScrollView {
                
                VStack {
                    
                    Image(systemName: "brain")
                        .font(.system(size: 60))
                    
                    ProductivityChartView(
                        entries: entries
                    )
                    
                    ForEach(
                        PatternAnalyzer.analyze(
                            entries: entries
                        ),
                        id: \.self
                    ) { insight in
                        
                        
                        SyncoCard {
                            
                            Text(insight)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Analytics")
        }
    }
}


#Preview {
    AnalyticsView()
}
