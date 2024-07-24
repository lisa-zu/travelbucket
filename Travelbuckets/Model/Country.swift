//
//  Country.swift
//  Travelbuckets
//
//  Created by Roman Zuchowski on 24.07.24.
//

import SwiftUI

enum Country: String, CaseIterable {
    case AF = "Afghanistan"
    case AX = "Åland Islands"
    case AL = "Albania"
//    case DZ = "Algeria"
//    case AS = "American Samoa"
//    case AD = "Andorra"
//    case AO = "Angola"
//    case AI = "Anguilla"
//    case AQ = "Antarctica"
//    case AG = "Antigua and Barbuda"
//    case AR = "Argentina"
//    case AM = "Armenia"
//    case AW = "Aruba"
//    case AU = "Australia"
//    case AT = "Austria"
//    case AZ = "Azerbaijan"
//    case BS = "Bahamas"
//    case BH = "Bahrain"
//    case BD = "Bangladesh"
//    case BB = "Barbados"
//    case BY = "Belarus"
//    case BE = "Belgium"
//    case BZ = "Belize"
//    case BJ = "Benin"
//    case BM = "Bermuda"
//    case BT = "Bhutan"
//    case BO = "Bolivia, Plurinational State of"
//    case BQ = "Bonaire, Sint Eustatius and Saba"
//    case BA = "Bosnia and Herzegovina"
//    case BW = "Botswana"
//    case BV = "Bouvet Island"
//    case BR = "Brazil"
//    case IO = "British Indian Ocean Territory"
//    case BN = "Brunei Darussalam"
}

extension Country {
    public var flagUrl: URL {
        switch self {
        case .AF:
            URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Flag_of_Afghanistan_%282013%E2%80%932021%29.svg/23px-Flag_of_Afghanistan_%282013%E2%80%932021%29.svg.png")!
        case .AX:
            URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Flag_of_%C3%85land.svg/23px-Flag_of_%C3%85land.svg.png")!
        case .AL:
            URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Flag_of_Albania.svg/21px-Flag_of_Albania.svg.png")!
        }
    }
    public var asyncFlagImage: AsyncImage<Image> {
        return AsyncImage(url: self.flagUrl)
    }
}
