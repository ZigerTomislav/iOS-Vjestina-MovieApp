//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation
import CoreData
import UIKit

class MoviesRepository {
    let dataLocal = MoviesDatabaseDataSource()
    let dataNetwork = MoviesNetworkDataSource()
    var moviePom = MovieData()
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
        
    func saveMovies() {
    let fetch: NSFetchRequest<Movie> = Movie.fetchRequest()
    
    let count = try? managedContext.count(for: fetch)
        if count == 0
        {
            print("asalam alejkum majdah")
            
        }
        moviePom.sve = [moviePom.popular,moviePom.recommended,moviePom.topRated,moviePom.trendingWeek]
        
        let neke = moviePom.sve
    let dataArray = dataNetwork.movieData1.trendingWeek
        print("neke")
        print("neke")
        
//        print(moviePom.trendingWeek)
    for dict in neke {
        
        for i in dict{
//            let btDict = i as! [String: Any]
            let entity = NSEntityDescription.entity(forEntityName: "Movie", in:
            managedContext)!
            let movie = Movie(entity: entity, insertInto: managedContext)
            if
                let id = i.id as? Int32,
                let title = i.title as? String,
                let posterPath = i.poster_path as? String
                
            {
                print(id)
                print(title)
                movie.id = id
                movie.title = title
                movie.poster_path = posterPath
                
                let image = UIImage(url: URL(string:"https://image.tmdb.org/t/p/original"+posterPath) )
                movie.img = image?.pngData()
                
            }
            
            }
            try? managedContext.save()
            
        }

        
    
    }
    
    func fetchMovies() -> [Movie] {
    let request: NSFetchRequest<Movie> = Movie.fetchRequest()
    do {
        let results = try managedContext.fetch(request)
        
        return results
    } catch let error as NSError {
        print("Error \(error) | Info: \(error.userInfo)")
    return []
    }
        
    }
}
