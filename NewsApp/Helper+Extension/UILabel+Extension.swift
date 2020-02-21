//
//  UILabel+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/17.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience public init(text: String? = nil,
                            font: UIFont? = UIFont.systemFont(ofSize: 14),
                            textColor: UIColor = .black,
                            textAlignment: NSTextAlignment = .left,
                            numberOfLines: Int = 1) {
        
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
