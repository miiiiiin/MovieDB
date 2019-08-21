//
//  MovieCell.swift
//  MovieDB
//
//  Created by 민송경 on 20/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation
import UIKit

class MovieCell: UITableViewCell {
    
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
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [posterImageView, titleLabel, voteAverageLabel, releaseDateLabel].forEach(contentView.addSubview)

        titleLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant: 20).isActive = true

        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        
        posterImageView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10).isActive = true
        
        posterImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant:120).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant:160).isActive = true
        
        releaseDateLabel.topAnchor.constraint(equalTo: self.posterImageView.topAnchor, constant: 20).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: self.posterImageView.rightAnchor, constant: 100).isActive = true
        
        voteAverageLabel.topAnchor.constraint(equalTo: self.releaseDateLabel.bottomAnchor, constant: 50).isActive = true
        voteAverageLabel.leadingAnchor.constraint(equalTo: self.releaseDateLabel.leadingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
