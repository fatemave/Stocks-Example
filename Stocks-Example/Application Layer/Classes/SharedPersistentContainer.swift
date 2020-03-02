//
//  SharedPersistentContainer.swift
//  Stocks-Example
//
//  Created by user on 02.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation
import CoreData

class SharedPersistentContainer: NSPersistentContainer {

    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.pro.appcraft.stocks-example")
        storeURL = storeURL?.appendingPathComponent("Stocks_Example.sqlite")
        return storeURL!
    }
}
