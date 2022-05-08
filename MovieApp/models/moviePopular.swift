//
//  moviePopular.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation

struct moviePopular : Codable{
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Float
    let vote_count: Int
}
