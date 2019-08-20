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
    }
    
    private func setUpLayout() {
        self.navigationItem.title = "Movie DB"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        self.view.backgroundColor = .white
    }
}

extension MovieListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieListVM == nil ? 0 : self.movieListVM.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        
        return cell
        
    }
}
