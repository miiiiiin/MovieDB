//
//  MovieListController.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation
import UIKit

class MovieListController: UIViewController {
    
    private var movieListVM: MovieListViewModel!
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        getMovies()
    }
    
    private func setUpLayout() {
        self.navigationItem.title = "Movie DB"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.view.backgroundColor = .white
    }
    
    private func getMovies() {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=54698ab662adbbf59ddeb3549ce2d68c&language=en-US&page=1")!
        
        Webservice().getMovies(url: url) { movies in
            
            if let movies = movies {
                self.movieListVM = MovieListViewModel(results: movies)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        
        return cell!
        
    }
}
