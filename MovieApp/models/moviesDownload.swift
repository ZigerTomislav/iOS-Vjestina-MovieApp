//
//  moviesDownload.swift
//  MovieApp
//
//  Created by Tomislav Žiger  on 07.05.2022..
//

import Foundation
struct moviesDownload : Codable{
    let page: Int
    let results: [moviePopular]
    let total_pages: Int
    let total_results: Int
}

