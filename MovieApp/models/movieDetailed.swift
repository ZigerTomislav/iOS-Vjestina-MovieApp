//
//  movieDetailed.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation

struct company: Codable{
    let id: Int
    let logo_path: String?
    let name: String
    let origin_country: String
}
struct country: Codable{
    let iso_3166_1: String
    let name:String
}
struct language: Codable{
    
}
struct movieDetailed: Codable {
    let adult: Bool
    let backdrop_path: String
    let belongs_to_collection: String?
    let budget: Int
    let genres: [genres]
    let homepage: String
    let id: Int
    let imdb_id: String
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: String
    let poster_path: String
    let production_companies: [company]
    let production_countries: [country]
    let release_date: String
    let revenue: Int
    let runtime: Int
    
    let status: String
    let tagline: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
    
}
