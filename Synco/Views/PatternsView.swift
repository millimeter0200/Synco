//
//  PatternsView.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/5/26.
//

import SwiftUI
import SwiftData


struct PatternsView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \DailyEntry.date, order: .reverse)
    private var entries: [DailyEntry]
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(entries) { entry in
                    
                    NavigationLink {

                        EditEntryView(entry: entry)

                    } label: {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text(entry.date.formatted(
                                date: .abbreviated,
                                time: .shortened
                            ))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            
                            Text(entry.mood)
                                .font(.largeTitle)
                            
                            Text("Sleep: \(entry.sleepHours, specifier: "%.1f") hours")
                            
                            Text("Energy: \(entry.energy)/10")
                            
                            Text("Productivity: \(entry.productivity)/10")
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(entries[index])
                    }

                    do {
                        try context.save()
                        print("Entry deleted")
                    } catch {
                        print("Delete failed: \(error)")
                    }
                }
            }
            .navigationTitle("Patterns")
        }
    }
}


#Preview {
    PatternsView()
}
