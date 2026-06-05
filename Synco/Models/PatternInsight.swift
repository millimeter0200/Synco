//
//  PatternInsight.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import Foundation


struct PatternInsight: Identifiable {
    
    let id = UUID()
    
    let icon: String
    
    let title: String
    
    let message: String
    
    let percentage: Double
    
    let confidence: String
    
    let sampleSize: Int
}
