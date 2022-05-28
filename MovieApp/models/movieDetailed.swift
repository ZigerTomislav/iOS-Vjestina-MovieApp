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
    let genres: [genres]
    let id: Int
    let poster_path: String?
    let title: String
    
}
