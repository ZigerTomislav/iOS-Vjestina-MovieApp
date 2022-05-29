//
//  CoreDataStack.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation
import CoreData
import UIKit
class CoreDataStack {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate;

    
lazy var persistentContainer: NSPersistentContainer = {
let container = NSPersistentContainer(name: "iOSVjestina")
container.loadPersistentStores(completionHandler: {
(storeDescription, error) in
if let error = error as NSError? {
fatalError("Unresolved error \(error), \(error.userInfo)")
}
})
return container
}()
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
