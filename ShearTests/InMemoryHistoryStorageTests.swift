//
//  InMemoryHistoryStorageTests.swift
//  ShearTests
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import XCTest

@testable import Shear

class InMemoryHistoryStorageTests: XCTestCase {
    var storage: InMemoryHistoryStorage!

    override func setUp() {
        super.setUp()
        
        storage = InMemoryHistoryStorage()
    }

    override func tearDown() {
        storage = nil
        
        super.tearDown()
    }
    
    func testDuplicateDetection() {
        let item0 = HistoryItem(kind: .plainText("0"))
        let item1 = HistoryItem(kind: .plainText("0"))
        XCTAssertEqual(item0, item1)
        
        storage.store(item: item0) { (error, item) in
            XCTAssertNil(error)
            XCTAssertEqual(item0, item)
        }
        storage.store(item: item1) { (error, item) in
            XCTAssertNotNil(error)
            XCTAssertEqual(item0, item)
            XCTAssertEqual(error, HistoryStorageStoreError.duplicate)
        }
    }

    func testStorageCount() {
        let item0 = HistoryItem(kind: .plainText("0"))
        storage.store(item: item0) { [weak self] (error, stored) in
            XCTAssertNil(error)
            XCTAssertEqual(item0, stored)
            
            XCTAssertEqual(self?.storage.count, 1)
        }
        let item1 = HistoryItem(kind: .plainText("1"))
        storage.store(item: item1) { [weak self] (error, stored) in
            XCTAssertNil(error)
            XCTAssertEqual(item1, stored)
            
            XCTAssertEqual(self?.storage.count, 2)
        }
    }
}
