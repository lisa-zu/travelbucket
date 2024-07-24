//
//  BucketItem.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 24.07.24.
//

import Foundation

struct BucketItem: Codable {
    var country: String
    var date: [String:Date]
    var description: String
    var title: String
    
    enum CodingKeys: CodingKey {
        case country, date, description, title
    }
}

extension BucketItem {
    static var example: BucketItem {
        BucketItem(country: "TH", date: [ "start": Date.now, "end": Date.now ], description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.", title: "Test")
    }
}
