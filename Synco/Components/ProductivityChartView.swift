//
//  ProductivityChartView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI
import Charts


struct ProductivityChartView: View {
    
    
    let entries: [DailyEntry]
    
    
    var body: some View {
        
        
        VStack(alignment: .leading) {
            
            
            Text("Productivity Trend")
                .font(.headline)
            
            
            Chart(entries) { entry in
                
                
                LineMark(
                    x: .value(
                        "Date",
                        entry.date
                    ),
                    y: .value(
                        "Productivity",
                        entry.productivity
                    )
                )
                
                
                PointMark(
                    x: .value(
                        "Date",
                        entry.date
                    ),
                    y: .value(
                        "Productivity",
                        entry.productivity
                    )
                )
            }
            .frame(height: 220)
            
        }
        .padding()
    }
}


#Preview {
    ProductivityChartView(
        entries: []
    )
}
