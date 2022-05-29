//
//  MovieGroup+CoreDataProperties.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//
//

import Foundation
import CoreData


extension MovieGroup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieGroup> {
        return NSFetchRequest<MovieGroup>(entityName: "MovieGroup")
    }

    @NSManaged public var name: String?
    @NSManaged public var filmovi: NSSet?

}

// MARK: Generated accessors for filmovi
extension MovieGroup {

    @objc(addFilmoviObject:)
    @NSManaged public func addToFilmovi(_ value: Movie)

    @objc(removeFilmoviObject:)
    @NSManaged public func removeFromFilmovi(_ value: Movie)

    @objc(addFilmovi:)
    @NSManaged public func addToFilmovi(_ values: NSSet)

    @objc(removeFilmovi:)
    @NSManaged public func removeFromFilmovi(_ values: NSSet)

}

extension MovieGroup : Identifiable {

}
