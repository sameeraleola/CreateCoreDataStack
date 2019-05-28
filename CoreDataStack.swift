//
//  CoreDataStack.swift
//  
//
//  Created by Sameera Roussi on 5/27/19.
//

import Foundation
import CoreData

class CoreDataStack {
    
    // Make it a shared object
    static let shared = CoreDataStack()
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        
        // Tell the container to load it's persistence stores
        container.loadPersistentStores { (_, error) in
            // If there's an error loading the Pesistent stores then we're done.  Fatal error out.
            if let error = error {
                fatalError("Error loading Core data stores: \(error)")
            }
        } // container
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
