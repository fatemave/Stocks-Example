//
//  CoreDataStack.swift
//  Stocks-Widget
//
//  Created by user on 02.03.2020.
//  Copyright © 2020 appcraft. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = SharedPersistentContainer(name: "Stocks_Example")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
