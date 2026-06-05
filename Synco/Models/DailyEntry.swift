//
//  Item.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import Foundation
import SwiftData

@Model
class DailyEntry {
    
    var date: Date
    
    var mood: String
    var sleepHours: Double
    var energy: Int
    var productivity: Int
    
    var coffee: Bool
    var exercise: Bool
    var studied: Bool
    
    init(
        mood: String,
        sleepHours: Double,
        energy: Int,
        productivity: Int,
        coffee: Bool,
        exercise: Bool,
        studied: Bool
    ) {
        self.date = Date()
        self.mood = mood
        self.sleepHours = sleepHours
        self.energy = energy
        self.productivity = productivity
        self.coffee = coffee
        self.exercise = exercise
        self.studied = studied
    }
}
