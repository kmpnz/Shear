//
//  HistoryItem.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

struct HistoryItem: Hashable {
    let kind: ContentKind
    
    init(kind: ContentKind) {
        self.kind = kind
    }
}
