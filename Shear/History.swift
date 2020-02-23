//
//  History.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

enum HistoryStoreError: Error {
    case undefined
}

typealias HistoryStoreHandler = (_ error: HistoryStoreError?, _ item: HistoryItem) -> Void

class History: HistoryType {
    let storage: HistoryStorageType
    
    init(storage: HistoryStorageType) {
        self.storage = storage
    }
    
    func store(item: HistoryItem, handler: @escaping HistoryStoreHandler) {
        storage.store(item: item) { (error, storedItem) in
            if let _ = error {
                handler(.undefined, storedItem)
                return
            }
        }
    }
}
