//
//  HistoryStorageType.swift
//  Shear
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation

enum HistoryStorageStoreError: Error {
    case undefined
    case duplicate
}

typealias HistoryStorageStoreHandler = (_ error: HistoryStorageStoreError?, _ item: HistoryItem) -> Void

protocol HistoryStorageType {
    var count: Int { get }
    
    func store(item: HistoryItem, handler: @escaping HistoryStorageStoreHandler)
    
    func contains(item: HistoryItem) -> Bool
}
