//
//  App.swift
//  Shear
//
//  Created by Andreas Kompanez on 03.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Foundation
import Cocoa

class App {
    let statusMenu = StatusMenu()
    
    func start() {
        statusMenu.install(delegate: self)
    }
    
    func terminate() {
        NSApp.stop(self)
    }
}

extension App: StatusMenuDelegate {
    func statusMenuReceivedQuitAction(_: StatusMenu, sender: NSMenuItem) {
        terminate()
    }
}
