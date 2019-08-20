//
//  Movie.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation

struct MovieList: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {
    let title: String
    let voteAverage: Double
    let posterImage: String
    let releaseDate: Date
}
