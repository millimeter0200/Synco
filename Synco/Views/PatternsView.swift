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
    
    @Query(
        sort: \DailyEntry.date,
        order: .reverse
    )
    private var entries: [DailyEntry]
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        
        NavigationStack {
            
            if entries.isEmpty {

                    VStack(spacing: 16) {

                        Image(systemName: "leaf")

                            .font(.system(size: 60))

                        Text("No patterns yet")

                            .font(.title2)

                            .bold()

                        Text("Sync your first day to start discovering your habits.")

                            .foregroundStyle(.secondary)

                            .multilineTextAlignment(.center)

                    }

                    .padding()

                    .navigationTitle("Patterns")

            } else {
                
                List {
                    
                    ForEach(entries) { entry in
                        
                        NavigationLink {
                            
                            EditEntryView(entry: entry)
                            
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(
                                    DateFormatterHelper.format(entry.date)
                                )
                                .font(.caption)
                                .foregroundStyle(.secondary)
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
                            print(error)
                        }
                    }
                }
                .navigationTitle("Patterns")
                
                .toolbar {
                    if !entries.isEmpty {
                        Button("Clear All") {
                            showingDeleteAlert = true
                        }
                    }
                }
            
                .alert(
                    "Delete all entries?",
                    isPresented: $showingDeleteAlert
                ) {
                    Button("Delete", role: .destructive) {

                        for entry in entries {
                            context.delete(entry)
                        }

                        do {
                            try context.save()
                            print("All entries deleted")
                        } catch {
                            print("Delete failed: \(error)")
                        }
                    }

                    Button("Cancel", role: .cancel) {}

                } message: {
                    Text("This action cannot be undone.")
                }
            }
        }
    }
}


#Preview {
    PatternsView()
}
