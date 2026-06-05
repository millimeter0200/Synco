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
            
            VStack {

                Image(systemName: "brain")
                    .font(.system(size: 60))


                List(
                    PatternAnalyzer.analyze(
                        entries: entries
                    ),
                    id: \.self
                ) { insight in
                    
                    Text(insight)
                        .padding()
                }

            }
            .navigationTitle("Analytics")
        }
    }
}


#Preview {
    AnalyticsView()
}
