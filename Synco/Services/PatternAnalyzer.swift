//
//  PatternAnalyzer.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import Foundation


struct PatternAnalyzer {
    
    
    static func analyze(entries: [DailyEntry]) -> String {
        
        
        guard entries.count >= 3 else {
            return "Keep logging to discover patterns."
        }
        
        
        let goodSleepEntries = entries.filter {
            $0.sleepHours >= 7
        }
        
        
        let lowSleepEntries = entries.filter {
            $0.sleepHours < 7
        }
        
        
        guard !goodSleepEntries.isEmpty,
              !lowSleepEntries.isEmpty else {
            return "Not enough variation yet."
        }
        
        
        let goodSleepAverage =
        averageProductivity(goodSleepEntries)
        
        
        let lowSleepAverage =
        averageProductivity(lowSleepEntries)
        
        
        if goodSleepAverage > lowSleepAverage {
            
            return """
            😴 Better sleep detected
            
            Your productivity is higher when you sleep 7+ hours.
            
            Average:
            \(String(format: "%.1f", goodSleepAverage))/10 vs \(String(format: "%.1f", lowSleepAverage))/10
            """
            
        } else {
            
            return """
            🧠 Pattern detected
            
            Sleep does not appear to increase productivity yet.
            """
        }
    }
    
    
    private static func averageProductivity(
        _ entries: [DailyEntry]
    ) -> Double {
        
        let total = entries.reduce(0) {
            $0 + $1.productivity
        }
        
        return Double(total) / Double(entries.count)
    }
}
