//
//  CoreDataStack.swift
//  QlueToDo
//
//  Created by Muhksin Hilmi on 19/07/2019.
//  Copyright © 2019 LevUp. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    private init() {}
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "QlueToDo")
        
        container.loadPersistentStores(completionHandler: { (_, error) in
            guard let error = error as NSError? else { return }
            fatalError("Unresolved error: \(error), \(error.userInfo)")
        })
        
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        return container
    }()
    
    func clearStorage(index: Int) {
        let isInMemoryStore = CoreDataStack.shared.persistentContainer.persistentStoreDescriptions.reduce(false) {
            return $0 ? true : $1.type == NSInMemoryStoreType
        }
        
        let managedObjectContext = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListToDo")
        
        if !isInMemoryStore {
            do {
                let news = try managedObjectContext.fetch(fetchRequest)
                for value in news {
                    print(value)
                    managedObjectContext.delete(value as! NSManagedObject)
                }
            } catch let error as NSError {
                print(error)
            }
        } else {
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            do {
                try managedObjectContext.execute(batchDeleteRequest)
            } catch let error as NSError {
                print(error)
            }
        }
    }
}
