//
//  Analyticsview.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI

struct AnalyticsView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Image(systemName: "chart.xyaxis.line")
                    .font(.system(size: 60))
                
                Text("Your insights appear here")
                
            }
            .navigationTitle("Analytics")
        }
    }
}

#Preview {
    AnalyticsView()
}
