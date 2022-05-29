//
//  movieStored.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 29.05.2022..
//

import Foundation

struct movieStored : Codable{
//    let adult: Bool
//    let backdrop_path: String
//    let genre_ids: [Int]
    let id: Int32
    let favorite: Bool
    let img: Data?
//    let original_language: String
//    let original_title: String
//    let overview: String
//    let popularity: Float
    let poster_path: String
//    let release_date: String
    let title: String
//    let video: Bool
//    let vote_average: Float
//    let vote_count: Int
    init(fromModel model: Movie) {
        self.id = model.id
        self.title = model.title!
        self.poster_path = model.poster_path!
        self.favorite = model.favorite
        self.img = model.img
    }
}
