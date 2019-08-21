//
//  UIView+Exntension.swift
//  MovieDB
//
//  Created by 민송경 on 21/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import UIKit

extension UIView {
    
    convenience init(forAutoLayout: ()) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
