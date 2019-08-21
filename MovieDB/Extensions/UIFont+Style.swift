//
//  UIFont+Style.swift
//  MovieDB
//
//  Created by 민송경 on 21/08/2019.
//  Copyright © 2019 songkyung min. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func regularFont(with size: CGFloat) -> UIFont? {
        return UIFont(name: "AvenirNext-Regular", size: size)
    }
    
    static func demiBoldFont(with size: CGFloat) -> UIFont? {
        return UIFont(name: "AvenirNext-DemiBold", size: size)
    }
    
    static var block = UIFont.demiBoldFont(with: 19)
    static var header = UIFont.regularFont(with: 17)
    static var body = UIFont.regularFont(with: 16)
}
