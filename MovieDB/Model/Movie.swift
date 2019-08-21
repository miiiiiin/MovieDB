//
//  Movie.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation

struct MovieList: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let vote_average: Double
    let poster_path: String
    let release_date: String
    let vote_count: Int
    let overview: String
    let popularity: Double
    let original_language: String
    let id: Int
}
