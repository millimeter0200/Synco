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
    
    @State private var showSavedAlert = false
    
    @State private var coffee = false
    @State private var exercise = false
    @State private var studied = false
    
    
    var body: some View {
        
        
        NavigationStack {
            
            
            ScrollView {
                
                
                VStack(
                    alignment: .leading,
                    spacing: SyncoTheme.spacing
                ) {
                    
                    
                    Text("How's your rhythm?")
                        .font(.title2)
                        .bold()
                    
                    
                    
                    // Mood
                
                    SyncoCard {
                        
                        VStack(
                            alignment: .leading,
                            spacing: 15
                        ) {
                            
                            Text("Mood")
                                .font(.headline)
                            
                            
                            Picker(
                                "Mood",
                                selection: $mood
                            ) {
                                
                                Text("😊 Happy")
                                    .tag("😊")
                                
                                Text("😌 Calm")
                                    .tag("😌")
                                
                                Text("😐 Okay")
                                    .tag("😐")
                                
                                Text("😴 Tired")
                                    .tag("😴")
                                
                                Text("😔 Low")
                                    .tag("😔")
                            }
                            .pickerStyle(.segmented)
                        }
                    }
                    
                    
                    
                    // Sleep
                    
                    SyncoCard {
                        
                        VStack(
                            alignment: .leading
                        ) {
                            
                            Text("Sleep")
                                .font(.headline)
                            
                            
                            Slider(
                                value: $sleepHours,
                                in: 0...12,
                                step: 0.5
                            )
                            
                            
                            Text(
                                "\(sleepHours, specifier: "%.1f") hours"
                            )
                        }
                    }
                    
                    
                    
                    // Energy
                    
                    SyncoCard {
                        
                        VStack(
                            alignment: .leading
                        ) {
                            
                            Text(
                                "⚡ Energy: \(energy)/10"
                            )
                            
                            
                            Stepper(
                                "",
                                value: $energy,
                                in: 1...10
                            )
                        }
                    }
                    
                    
                    
                    // Productivity
                    
                    SyncoCard {
                        
                        VStack(
                            alignment: .leading
                        ) {
                            
                            Text(
                                "🔥 Productivity: \(productivity)/10"
                            )
                            
                            
                            Stepper(
                                "",
                                value: $productivity,
                                in: 1...10
                            )
                        }
                    }
                    
                    
                    
                    // Tags
                    
                    SyncoCard {
                        
                        VStack(
                            alignment: .leading,
                            spacing: 15
                        ) {
                            
                            Text("Today's signals")
                                .font(.headline)
                            
                            
                            Toggle(
                                "☕ Coffee",
                                isOn: $coffee
                            )
                            
                            Toggle(
                                "🏃 Exercise",
                                isOn: $exercise
                            )
                            
                            Toggle(
                                "📚 Focus",
                                isOn: $studied
                            )
                        }
                    }
                    
                    
                    
                    Button {

                        saveEntry()
                        showSavedAlert = true

                    } label: {

                        Text("Sync my day")
                            .bold()
                            .frame(
                                maxWidth: .infinity
                            )
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .alert("Day synced ✨", isPresented: $showSavedAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("Your entry has been saved.")
                    }
                    
                    
                }
                .padding()
            }
            .background(
                SyncoTheme.background
            )
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
