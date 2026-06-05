//
//  SyncoCard.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI


struct SyncoCard<Content: View>: View {
    
    
    let content: Content
    
    
    init(
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
    }
    
    
    var body: some View {
        
        
        content
            .padding()
            .frame(
                maxWidth: .infinity,
                alignment: .leading
            )
            .background(
                SyncoTheme.card
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius:
                        SyncoTheme.cornerRadius
                )
            )
            .shadow(
                radius: 5,
                y: 3
            )
    }
}
