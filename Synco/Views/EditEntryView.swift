//
//  EditEntry.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/6/26.
//

import SwiftUI
import SwiftData

struct EditEntryView: View {

    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @Bindable var entry: DailyEntry

    var body: some View {
        Form {

            Section("Mood") {
                Picker("Mood", selection: $entry.mood) {
                    Text("😊 Happy").tag("😊")
                    Text("😌 Calm").tag("😌")
                    Text("😐 Okay").tag("😐")
                    Text("😴 Tired").tag("😴")
                    Text("😔 Low").tag("😔")
                }
                .pickerStyle(.segmented)
            }

            Section("Sleep") {
                Slider(
                    value: $entry.sleepHours,
                    in: 0...12,
                    step: 0.5
                )

                Text("\(entry.sleepHours, specifier: "%.1f") hours")
            }

            Section("Energy") {
                Stepper(
                    "Energy: \(entry.energy)/10",
                    value: $entry.energy,
                    in: 1...10
                )
            }

            Section("Productivity") {
                Stepper(
                    "Productivity: \(entry.productivity)/10",
                    value: $entry.productivity,
                    in: 1...10
                )
            }

            Section("Signals") {

                Toggle(
                    "☕️ Coffee",
                    isOn: $entry.coffee
                )

                Toggle(
                    "🏃 Exercise",
                    isOn: $entry.exercise
                )

                Toggle(
                    "📚 Focus",
                    isOn: $entry.studied
                )
            }
        }
        .navigationTitle("Edit Entry")
        .toolbar {

            Button("Save") {

                do {
                    try context.save()
                    print("Entry updated")
                    dismiss()

                } catch {
                    print("Update failed: \(error)")
                }
            }
        }
    }
}
