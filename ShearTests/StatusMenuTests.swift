//
//  StatusMenuTests.swift
//  ShearTests
//
//  Created by Andreas Kompanez on 23.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import XCTest

@testable import Shear

class StatusMenuTests: XCTestCase {
    var statusMenu: StatusMenu!
    
    override func setUp() {
        super.setUp()
        
        statusMenu = StatusMenu()
    }
    
    override func tearDown() {
        statusMenu = nil
        
        super.tearDown()
    }
    
    func testStatusMenuInstallation() {
        statusMenu.install(delegate: nil)
        XCTAssertNotNil(statusMenu.item, "The status item is not defined")
        guard let statusItem = statusMenu.item, let button = statusItem.button else {
            XCTFail("The main menu button is not defined")
            return
        }
        XCTAssertNotNil(button.image, "The main menu image is not set")
    }
}
