//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation

struct MovieListViewModel {
    let movies: [Movie]
}

extension MovieListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection (_ section: Int) -> Int {
        return self.movies.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.movies[index]
        return MovieViewModel(movie)
    }
}

struct MovieViewModel {
    
    private let movie: Movie

    init(_ movie: Movie) {
        self.movie = movie
    }
    
    var title: String {
        return self.movie.title
    }
    
    var voteAverage: Double {
        return self.movie.voteAverage
    }
    
    var posterImage: String {
        return self.movie.posterImage
    }
    
    var releaseDate: Date {
        return self.movie.releaseDate
    }
}
