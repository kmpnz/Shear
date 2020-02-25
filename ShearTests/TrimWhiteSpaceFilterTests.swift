//
//  TrimWhiteSpaceFilterTests.swift
//  ShearTests
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import XCTest

@testable import Shear

class TrimWhiteSpaceFilterTests: XCTestCase {
    var filter: TrimWhiteSpaceFilter!

    override func setUp() {
        super.setUp()

        filter = TrimWhiteSpaceFilter()
    }

    override func tearDown() {
        filter = nil

        super.tearDown()
    }

    func testFilterTrimsText() {
        let inputText = "   abc  "
        let content = ContentKind.plainText(inputText)
        if let filtered = filter.apply(on: content) {
            switch filtered {
            case .plainText(let text):
                XCTAssertFalse(text.isEmpty)
                XCTAssertEqual(text, "abc")
            default:
                XCTFail("Unexpected content kind")
            }
        }
        else {
            XCTFail("Filter failed")
        }
    }
}
