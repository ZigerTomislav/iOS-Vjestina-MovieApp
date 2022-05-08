//
//  genre.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation

struct genre : Codable{
    let id : Int
    let name : String
}
struct genres: Codable{
    let genres: [genre]
}
