//
//  MovieData.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 08.05.2022..
//

import Foundation
import Network
import UIKit

class MovieData {
    var popular = [moviePopular]()
    var trendingDay = [moviePopular]()
    var trendingWeek = [moviePopular]()
    var topRated = [moviePopular]()
    var recommended = [moviePopular]()
    let net = NetworkService()
    var sve = [[moviePopular]]()
    var tab = UITableView()
    
    
    var g = [genre]()
    var titles = ["Whats Popular", "Trending", "Recommended", "TopRated"]
    var time = ["week","day"]
    init(){
        self.pokretac()
        self.sve = [self.popular,trendingDay,topRated,recommended]
        
    }
    func getAll( )async{
        let net = NetworkService()
        let genreTask = Task{ () -> genres in
            let url = "https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=0f65fdc10957a26750e4d313e4994d7e"
            let request = net.pomRequest(url)
            
            let moviesic: genres = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let popularTask = Task{ () -> moviesDownload in
            let url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=0f65fdc10957a26750e4d313e4994d7e"
            let request = net.pomRequest(url)
            let moviesic: moviesDownload = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let trendingWeektask = Task{ () -> moviesDownload in
            let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=0f65fdc10957a26750e4d313e4994d7e&page=1"
            let request = net.pomRequest(url)
            let moviesic: moviesDownload = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let trendingDaytask = Task{ () -> moviesDownload in
            let url = "https://api.themoviedb.org/3/trending/movie/day?api_key=0f65fdc10957a26750e4d313e4994d7e&page=1"
            let request = net.pomRequest(url)
            let moviesic: moviesDownload = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let topRatedTask = Task{ () -> moviesDownload in
            let url =
            "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&api_key=0f65fdc10957a26750e4d313e4994d7e&page=1"
            let request = net.pomRequest(url)
            let moviesic: moviesDownload = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let  recommendedTask = Task{ () -> moviesDownload in
            let url = "https://api.themoviedb.org/3/movie/103/recommendations?language=en-US&page=1&api_key=0f65fdc10957a26750e4d313e4994d7e"
            let request = net.pomRequest(url)
            let moviesic: moviesDownload = try await net.executeUrlRequest(request)
            return moviesic
                                                                                      
        }
        let resultGenre = await genreTask.result
        let resultR = await recommendedTask.result
        let resultTop = await topRatedTask.result
        let resultDay = await trendingDaytask.result
        let resultWeek = await trendingWeektask.result
        let resultPop = await popularTask.result
        
        do {
            self.popular = try resultPop.get().results
        }
        catch{
            print(error)
        }
        do {
            self.trendingDay = try resultDay.get().results
        }
        catch{
            print(error)
        }
        do {
            self.trendingWeek = try resultWeek.get().results
        }
        catch{
            print(error)
        }
        do {
            self.g = try resultGenre.get().genres
        }
        catch{
            print(error)
        }
        do {
            self.topRated = try resultTop.get().results
        }
        catch{
            print(error)
        }
        do {
            self.recommended = try resultR.get().results
        }
        catch{
            print(error)
        }
        
    }
    func pokretac(){
        Task{
            await getAll()
            
        }
        
        tab.reloadData()
    }
}
