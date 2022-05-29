//
//  MoviesDatabaseDataSource.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation
import CoreData
import UIKit

class MoviesDatabaseDataSource {
   
    var movies: [NSManagedObject] = []
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveMovie(name: String) {
    // 1
    let entity = NSEntityDescription.entity(
    forEntityName: "Movie",
    in: managedContext)!
    let city = NSManagedObject(entity: entity, insertInto: managedContext)
    // 3
    city.setValue(name, forKeyPath: "name")
    // 4
    do {
        try managedContext.save()
        movies.append(city)
    } catch let error as NSError {
        print("Could not save. \(error), \(error.userInfo)")
    }
    }
    
}

