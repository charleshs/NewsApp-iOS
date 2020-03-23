//
//  UIImageView+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/17.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience public init(image: UIImage? = nil,
                            contentMode: ContentMode = .scaleAspectFill) {
        
        self.init(image: image)
        self.contentMode = contentMode
        clipsToBounds = true
    }
}
