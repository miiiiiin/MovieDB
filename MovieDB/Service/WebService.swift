//
//  WebService.swift
//  MovieDB
//
//  Created by 민송경 on 21/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation

class Webservice {
    
    func getMovies(url: URL, completion: @escaping ([Movie]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
                
                let movieList = try? JSONDecoder().decode(MovieList.self, from: data)
                
                if let movieList = movieList {
                    completion(movieList.results)
                }
                print(movieList?.results)
            }
        }.resume()
    }
}
