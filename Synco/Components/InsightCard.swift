//
//  InsightCard.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI


struct InsightCard: View {
    
    
    let insight: PatternInsight
    
    
    var body: some View {
        
        
        SyncoCard {
            
            VStack(
                alignment: .leading,
                spacing: 12
            ) {
                
                Text(
                    "\(insight.icon) \(insight.title)"
                )
                .font(.headline)
                
                
                Text(insight.message)
                
                
                Text(
                    "\(Int(insight.percentage))%"
                )
                .font(.largeTitle)
                .bold()
                
                
                Text(
                    "Confidence: \(insight.confidence)"
                )
                .foregroundStyle(.secondary)
                
                
                Text(
                    "\(insight.sampleSize) synced days"
                )
                .font(.caption)
                .foregroundStyle(.secondary)
            }
        }
    }
}
