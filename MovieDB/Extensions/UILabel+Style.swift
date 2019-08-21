//
//  UILabel+Style.swift
//  MovieDB
//
//  Created by 민송경 on 21/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    static var block: UILabel {
        let label = UILabel(forAutoLayout: ())
        label.font = .block
        label.textColor = .black
        return label
    }
    
    static var header: UILabel {
        let label = UILabel(forAutoLayout: ())
        label.font = .header
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }
    
    static var body: UILabel {
        let label = UILabel(forAutoLayout: ())
        label.font = .body
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }
}
