//
//  MovieListController.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

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
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        tableView = UITableView(frame: CGRect(x: 0, y: barHeight+navigationBarHeight, width: displayWidth, height: displayHeight - (barHeight+navigationBarHeight)))
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        
        self.view.addSubview(tableView)

    }
    
    private func getMovies() {
        
        let url = URL(string: URLs.API.baseURL + "3/movie/now_playing?api_key=******&language=en-US&page=1")!
        
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else {
            fatalError("movie cell is not found")
        }
        
        let movieVM = self.movieListVM.movieAtIndex(indexPath.row)
        
        cell.titleLabel.text = movieVM.title
        cell.posterImageView.sd_setImage(with: URL(string: URLs.API.URL_Image + movieVM.posterImage))
        cell.voteAverageLabel.text = String(movieVM.voteAverage)
        cell.releaseDateLabel.text = movieVM.releaseDate
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
