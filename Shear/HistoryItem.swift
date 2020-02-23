//
//  HistoryItem.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

protocol StringRepresentable {
    var string: String { get }
}

enum HistoryItemKind: Hashable, Equatable {
    case plainText(String)
}

struct HistoryItem: Hashable {
    let kind: HistoryItemKind
    
    init(kind: HistoryItemKind) {
        self.kind = kind
    }
}


