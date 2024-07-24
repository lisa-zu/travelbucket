//
//  HashableImage.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 24.07.24.
//

import SwiftUI
import Foundation

struct HashableImage: Identifiable {
    let id: UUID = UUID()
    var image: Image
    
    init(image: Image) {
        self.image = image
    }
}

extension HashableImage: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
