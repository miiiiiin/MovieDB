//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation

struct MovieListViewModel {
    let results: [Movie]
}

extension MovieListViewModel {
    var numberOfSection: Int {
        return 1
    }
    
    func numberOfRowsInSection (_ section: Int) -> Int {
        return self.results.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let movie = self.results[index]
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
        return self.movie.vote_average
    }
    
    var posterImage: String {
        return self.movie.poster_path
    }
    
    var releaseDate: String {
        return self.movie.release_date
    }
}
