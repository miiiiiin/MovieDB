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
