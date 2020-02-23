//
//  AppDelegate.swift
//  Shear
//
//  Created by Andreas Kompanez on 03.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Cocoa
import HotKey

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
    
    var app: App!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let history = History(storage: InMemoryHistoryStorage())
        app = App(history: history)
        app.start()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        app.terminate()
    }
}
