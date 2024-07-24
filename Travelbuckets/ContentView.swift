//
//  ContentView.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 23.07.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingCreationSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            BucketsList()
            .navigationTitle("Travelbuckets")
            .toolbar {
                ToolbarItem(id: "add_bucket", placement: .topBarTrailing) {
                    Button("Add", systemImage: "text.badge.plus") {
                        isShowingCreationSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingCreationSheet, content: {
                CreateView()
            })
        }
    }
}

#Preview {
    ContentView()
}
