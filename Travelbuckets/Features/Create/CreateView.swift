//
//  CreateView.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 23.07.24.
//

import SwiftUI

struct CreateView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var country: String?
    @State private var startDate: Date = Date.now
    @State private var endDate: Date = Date.now
    
    let countryCodeArray = Locale.Region.isoRegions.compactMap {
        Locale.current.localizedString(forRegionCode: $0.identifier)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField(text: $title) {
                    Text("Titel")
                }
                TextField(text: $description) {
                    Text("Beschreibung")
                }
                Picker(selection: $country) {
                    ForEach(countryCodeArray, id: \.self) { country in
                        Text(country).tag(country as String?)
                    }
                } label: {
                    Text("Land")
                }
                .pickerStyle(.navigationLink)
                
                HStack {
                    DatePicker(selection: $startDate, displayedComponents: .date) {
                        Image(systemName: "calendar")
                    }
                    DatePicker(selection: $endDate, in: startDate..., displayedComponents: .date) {
                        Image(systemName: "calendar.badge.clock")
                    }
                }
            }
            .navigationTitle("Bucket erstellen")
            .toolbar {
                ToolbarItem(id: "save_bucket", placement: .topBarTrailing) {
                    Button("Speichern") {
                        //
                    }
                }
            }
        }
    }
}

#Preview {
    CreateView()
}
