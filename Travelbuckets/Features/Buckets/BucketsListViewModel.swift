//
//  BucketListViewModel.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 24.07.24.
//

import Foundation

class BucketsListViewModel: ObservableObject {
    @Published var bucketSearchString: String = ""
    let exampleData: [BucketItem] = [BucketItem.example]
}

extension BucketsListViewModel {
    func getCountryFlagEmoji(for countryCode: String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in countryCode.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
