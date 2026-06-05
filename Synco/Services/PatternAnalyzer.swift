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
        
        
        analyzeSleep(entries, insights: &insights)
        analyzeCoffee(entries, insights: &insights)
        analyzeExercise(entries, insights: &insights)
        analyzeStudy(entries, insights: &insights)
        
        
        if insights.isEmpty {
            insights.append(
                "No strong patterns discovered yet."
            )
        }
        
        
        return insights
    }
    
    
    // MARK: - Categories
    
    
    private static func analyzeSleep(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter {
                $0.sleepHours >= 7
            },
            second: entries.filter {
                $0.sleepHours < 7
            },
            title: "😴 Sleep",
            description: "7+ hours of sleep is associated with productivity.",
            insights: &insights
        )
    }
    
    
    private static func analyzeCoffee(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter {
                $0.coffee
            },
            second: entries.filter {
                !$0.coffee
            },
            title: "☕ Coffee",
            description: "Coffee days show a productivity difference.",
            insights: &insights
        )
    }
    
    
    private static func analyzeExercise(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter {
                $0.exercise
            },
            second: entries.filter {
                !$0.exercise
            },
            title: "🏃 Exercise",
            description: "Exercise days show a productivity difference.",
            insights: &insights
        )
    }
    
    
    private static func analyzeStudy(
        _ entries: [DailyEntry],
        insights: inout [String]
    ) {
        
        compare(
            first: entries.filter {
                $0.studied
            },
            second: entries.filter {
                !$0.studied
            },
            title: "📚 Study",
            description: "Study days appear related to productivity.",
            insights: &insights
        )
    }
    
    
    // MARK: - Engine
    
    
    private static func compare(
        first: [DailyEntry],
        second: [DailyEntry],
        title: String,
        description: String,
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
        
        
        let difference =
        firstAverage - secondAverage
        
        
        guard abs(difference) >= 1 else {
            return
        }
        
        
        let percentage =
        (difference / secondAverage) * 100
        
        
        let confidence =
        confidenceLevel(
            sampleSize: first.count + second.count
        )
        
        
        let direction =
        difference > 0 ? "higher" : "lower"
        
        
        insights.append(
            """
            \(title)
            
            \(description)
            
            Productivity is \(direction) by:
            \(String(format: "%.0f", abs(percentage)))%
            
            Confidence:
            \(confidence)
            
            Based on:
            \(first.count + second.count) entries
            """
        )
    }
    
    
    private static func confidenceLevel(
        sampleSize: Int
    ) -> String {
        
        switch sampleSize {
            
        case 0..<7:
            return "Low"
            
        case 7..<20:
            return "Medium"
            
        default:
            return "High"
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
