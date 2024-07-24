//
//  CreateView.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 23.07.24.
//

import SwiftUI
import PhotosUI

struct CreateView: View {
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var country: String?
    @State private var startDate: Date = Date.now
    @State private var endDate: Date = Date.now
    @State private var pickedImages: [PhotosPickerItem] = [PhotosPickerItem]()
    @State private var images: [HashableImage] = [HashableImage]()
    
    let countryCodeArray = Locale.Region.isoRegions.compactMap {
        Locale.current.localizedString(forRegionCode: $0.identifier)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Allgemeines") {
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
                Section("Bilder") {
                    PhotosPicker(selection: $pickedImages, maxSelectionCount: 6, selectionBehavior: .default, matching: .images) {
                        Text("Bilder auswählen")
                    }
                    .onChange(of: pickedImages) { oldValue, newValue in
                        Task {
                            self.images = []
                            newValue.forEach { item in
                                item.loadTransferable(type: Image.self) { result in
                                    switch result {
                                    case .success(let success):
                                        if let image = success {
                                            let _hashableImage: HashableImage = HashableImage(image: image)
                                            images.append(_hashableImage)
                                        }
                                    case .failure(let error):
                                        debugPrint("Failed: \(error.localizedDescription)")
                                    }
                                }
                            }
                        }
                    }
                    if images.count != 0 {
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: [ .init() ]) {
                                ForEach(self.images, id: \.self) { item in
                                    item.image
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .clipShape(RoundedRectangle(cornerRadius: 8.0))
                                }
                            }
                            .padding(.horizontal)
                        }
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
