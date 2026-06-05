//
//  PatternAnalyzer.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import Foundation


struct PatternAnalyzer {
    
    
    static func analyze(entries: [DailyEntry]) -> [String] {
        
        
        guard entries.count >= 3 else {
            return [
                "Keep logging to discover patterns."
            ]
        }
        
        
        var insights: [String] = []
        
        
        analyzeSleep(
            entries,
            insights: &insights
        )
        
        analyzeCoffee(
            entries,
            insights: &insights
        )
        
        analyzeExercise(
            entries,
            insights: &insights
        )
        
        analyzeStudy(
            entries,
            insights: &insights
        )
        
        
        if insights.isEmpty {
            insights.append(
                "No strong patterns discovered yet."
            )
        }
        
        
        return insights
    }
    
    
    // MARK: - Sleep
    
    
    private static func analyzeSleep(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        let goodSleep = entries.filter {
            $0.sleepHours >= 7
        }
        
        let lowSleep = entries.filter {
            $0.sleepHours < 7
        }
        
        
        compare(
            first: goodSleep,
            second: lowSleep,
            title: "😴 Sleep Pattern",
            positive: "You are more productive with 7+ hours of sleep.",
            insights: &insights
        )
    }
    
    
    
    // MARK: - Coffee
    
    
    private static func analyzeCoffee(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter { $0.coffee },
            second: entries.filter { !$0.coffee },
            title: "☕ Coffee Pattern",
            positive: "Coffee days are linked with higher productivity.",
            insights: &insights
        )
    }
    
    
    
    // MARK: - Exercise
    
    
    private static func analyzeExercise(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter { $0.exercise },
            second: entries.filter { !$0.exercise },
            title: "🏃 Exercise Pattern",
            positive: "Exercise days usually have higher productivity.",
            insights: &insights
        )
    }
    
    
    
    // MARK: - Study
    
    
    private static func analyzeStudy(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter { $0.studied },
            second: entries.filter { !$0.studied },
            title: "📚 Study Pattern",
            positive: "Studying appears on your productive days.",
            insights: &insights
        )
    }
    
    
    
    // MARK: - Helpers
    
    
    private static func compare(
        first: [DailyEntry],
        second: [DailyEntry],
        title: String,
        positive: String,
        insights: inout [String]
    ) {
        
        
        guard !first.isEmpty,
              !second.isEmpty else {
            return
        }
        
        
        let firstAverage =
        averageProductivity(first)
        
        let secondAverage =
        averageProductivity(second)
        
        
        if firstAverage > secondAverage {
            
            let difference =
            firstAverage - secondAverage
            
            
            insights.append(
                """
                \(title)
                
                \(positive)
                
                Difference:
                +\(String(format: "%.1f", difference)) points
                """
            )
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
