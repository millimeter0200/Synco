//
//  TodayView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI
import SwiftData

struct TodayView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var mood = "😊"
    @State private var sleepHours = 7.0
    @State private var energy = 5
    @State private var productivity = 5
    
    @State private var coffee = false
    @State private var exercise = false
    @State private var studied = false
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Mood") {
                    Picker("How do you feel?", selection: $mood) {
                        Text("😊 Happy").tag("😊")
                        Text("😐 Neutral").tag("😐")
                        Text("😫 Stressed").tag("😫")
                        Text("😭 Sad").tag("😭")
                    }
                }
                
                
                Section("Sleep") {
                    
                    Slider(
                        value: $sleepHours,
                        in: 0...12,
                        step: 0.5
                    )
                    
                    Text("\(sleepHours, specifier: "%.1f") hours")
                }
                
                
                Section("Energy") {
                    
                    Stepper(
                        "Energy: \(energy)/10",
                        value: $energy,
                        in: 1...10
                    )
                }
                
                
                Section("Productivity") {
                    
                    Stepper(
                        "Productivity: \(productivity)/10",
                        value: $productivity,
                        in: 1...10
                    )
                }
                
                
                Section("Tags") {
                    
                    Toggle("☕ Coffee", isOn: $coffee)
                    
                    Toggle("🏃 Exercise", isOn: $exercise)
                    
                    Toggle("📚 Studied", isOn: $studied)
                }
                
                
                Button("Save Entry") {
                    saveEntry()
                }
                
            }
            .navigationTitle("Today")
        }
    }
    
    
    func saveEntry() {
        
        let entry = DailyEntry(
            mood: mood,
            sleepHours: sleepHours,
            energy: energy,
            productivity: productivity,
            coffee: coffee,
            exercise: exercise,
            studied: studied
        )
        
        context.insert(entry)
        
        print("Entry saved")
    }
}


#Preview {
    TodayView()
}
