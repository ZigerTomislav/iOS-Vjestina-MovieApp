//
//  MovieGenre+CoreDataProperties.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//
//

import Foundation
import CoreData


extension MovieGenre {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieGenre> {
        return NSFetchRequest<MovieGenre>(entityName: "MovieGenre")
    }

    @NSManaged public var id_genre: Int32
    @NSManaged public var name: String?
    @NSManaged public var genres: Movie?

}

extension MovieGenre : Identifiable {

}
