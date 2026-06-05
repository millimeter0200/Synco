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
                        
                        
                        Text(insight)
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding()
                            .background(.regularMaterial)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                            )
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
