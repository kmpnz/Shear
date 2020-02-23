//
//  Filter.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

protocol FilterType {
    func apply(on content: ContentKind) -> ContentKind?
}

class TrimWhiteSpaceFilter: FilterType {
    func apply(on content: ContentKind) -> ContentKind? {
        switch content {
        case .plainText(let text):
            let charSet = CharacterSet.whitespacesAndNewlines
            let trimmed = text.components(separatedBy: charSet).joined()
            return .plainText(trimmed)
        default:
            return nil
        }
    }
}
