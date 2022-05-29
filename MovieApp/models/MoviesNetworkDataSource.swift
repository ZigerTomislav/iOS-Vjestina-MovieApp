//
//  MoviesNetworkDataSource.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation

class MoviesNetworkDataSource{
    let net = NetworkService()
    var movieData1 = MovieData()
    func getMovies(){
    movieData1.sve = [movieData1.popular,movieData1.recommended,movieData1.topRated,movieData1.trendingWeek]
    }
    
}
