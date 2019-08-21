//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by 민송경 on 21/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {

    var movieVM: MovieViewModel!
    
    var upperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let posterImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 15
        img.layer.shadowRadius = 8/2
        img.layer.shadowOffset = CGSize(width: 0, height: 2)
        img.layer.shadowColor = UIColor(red:0/255, green:0/255, blue:0/255, alpha: 0.2).cgColor
        img.layer.shadowOpacity = 0.8
        img.clipsToBounds = true
        return img
    }()
    
    let titleLabel = UILabel.block
    let releaseDate = UILabel.header
    let voteCount = UILabel.header
    let popularity = UILabel.header
    let language = UILabel.header
    let descriptionLabel = UILabel.block
    let overView = UILabel.body
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posterImageView.sd_setImage(with: URL(string: URLs.API.URL_Image + movieVM.posterImage))
        titleLabel.text = movieVM.title
        releaseDate.text = "Release Date : " + movieVM.releaseDate
        voteCount.text = "Vote Count : " + String(movieVM.voteCount)
        popularity.text = "Popularity : " + String(movieVM.popularity)
        language.text = "Language : " + movieVM.language
        overView.text = movieVM.overview
        titleLabel.numberOfLines = 0
        overView.numberOfLines = 0
        descriptionLabel.text = "Overview"
        
        setUpLayout()
    }
    
    private func setUpLayout() {
        
        self.view.backgroundColor = .white
        self.navigationItem.title = "Movie Details"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let navigationBarHeight: CGFloat = self.navigationController!.navigationBar.frame.size.height
        
        upperView = UIView(frame: CGRect(x: 0, y: barHeight+navigationBarHeight, width: self.view.frame.width, height: 320))
        
        [upperView, posterImageView, titleLabel, releaseDate, voteCount, popularity, language, descriptionLabel, overView].forEach(self.view.addSubview)
        
        posterImageView.centerYAnchor.constraint(equalTo: self.upperView.centerYAnchor).isActive = true
        posterImageView.leftAnchor.constraint(equalTo: self.upperView.leftAnchor, constant: 20).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant:140).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant:200).isActive = true
       
        
        titleLabel.topAnchor.constraint(equalTo: self.posterImageView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.posterImageView.rightAnchor, constant: 30).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.upperView.rightAnchor, constant: -20).isActive = true
        
        releaseDate.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        
        voteCount.topAnchor.constraint(equalTo: self.releaseDate.bottomAnchor, constant: 5).isActive = true
        voteCount.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        
        popularity.topAnchor.constraint(equalTo: self.voteCount.bottomAnchor, constant: 5).isActive = true
        popularity.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        
        language.topAnchor.constraint(equalTo: self.popularity.bottomAnchor, constant: 5).isActive = true
        language.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: self.upperView.bottomAnchor, constant: 0).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
        overView.topAnchor.constraint(equalTo: self.upperView.bottomAnchor, constant: 50).isActive = true
        overView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        overView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -40).isActive = true
        
    }
}
