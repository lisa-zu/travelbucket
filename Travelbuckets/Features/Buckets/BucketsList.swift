//
//  BucketsList.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 24.07.24.
//

import SwiftUI

struct BucketsList: View {
    
    @StateObject private var vm: BucketsListViewModel = BucketsListViewModel()
    
    var body: some View {
        List(vm.exampleData, id: \.title) { item in
            VStack {
                HStack {
                    Text(item.title)
                        .font(.system(.headline, design: .rounded, weight: .bold))
                    Spacer()
                    HStack(spacing: 4) {
                        Text(vm.getCountryFlagEmoji(for: item.country))
                    }
                    .font(.system(.subheadline, design: .rounded, weight: .bold))
                }
                .padding(.top, 4)
                HStack {
                    Text(item.description).lineLimit(2)
                    Spacer()
                }
                .padding(.top, 4)
            }
        }
//        .searchable(text: $vm.bucketSearchString)
    }
}

#Preview {
    BucketsList()
}
