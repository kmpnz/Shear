//
//  InMemoryHistoryStorage.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

class InMemoryHistoryStorage: HistoryStorageType {
    private var storage: [HistoryItem] = []
    
    private var set: Set<HistoryItem> = []
    
    var count: Int {
        return storage.count
    }
    
    func store(item: HistoryItem, handler: (HistoryStorageStoreError?, HistoryItem) -> Void) {
        if contains(item: item) {
            handler(.duplicate, item)
            return
        }
        set.insert(item)
        storage.append(item)
        handler(nil, item)
    }
    
    func contains(item: HistoryItem) -> Bool {
        return set.contains(item)
    }
}
