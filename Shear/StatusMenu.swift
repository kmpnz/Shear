//
//  StatusMenu.swift
//  Shear
//
//  Created by Andreas Kompanez on 03.02.20.
//  Copyright © 2020 Andreas Kompanez. All rights reserved.
//

import Cocoa

protocol StatusMenuDelegate: class {
    func statusMenuReceivedQuitAction(_ statusMenu: StatusMenu, sender: NSMenuItem)
}

class StatusMenu: NSObject {
    weak var delegate: StatusMenuDelegate?
    
    private(set) var item: NSStatusItem?
    
    lazy var menu: NSMenu = {
        let menu = NSMenu(title: "Shear")
        let quitItem = NSMenuItem(title: "Quit",
                                  action: #selector(menuItemAction),
                                  keyEquivalent: "q")
        quitItem.target = self
        quitItem.isEnabled = true
        menu.addItem(quitItem)
        return menu
    }()
    
    static func makeStatusItem() -> NSStatusItem {
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        return statusItem
    }
    
    func install(delegate: StatusMenuDelegate?) {
        self.delegate = delegate
        
        let statusItem = type(of: self).makeStatusItem()
        item = statusItem
        statusItem.button?.image = NSImage(named: "MenuIcon")
        statusItem.menu = menu
        statusItem.behavior = .removalAllowed
        statusItem.isVisible = true
    }
    
    @objc func menuItemAction(_ sender: NSMenuItem) {
        delegate?.statusMenuReceivedQuitAction(self, sender: sender)
    }
}
