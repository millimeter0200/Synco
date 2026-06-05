//
//  PatternsView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI

struct PatternsView: View {
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Image(systemName: "brain")
                    .font(.system(size: 60))
                
                Text("No patterns yet")
                    .font(.title)
                
                Text("Log more days to discover yourself")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Patterns")
        }
    }
}

#Preview {
    PatternsView()
}
