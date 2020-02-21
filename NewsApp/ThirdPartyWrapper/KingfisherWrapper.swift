//
//  KingfisherWrapper.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(_ url: URL?, placeholder: UIImage? = nil) {
        kf.setImage(with: url, placeholder: placeholder)
    }
    
    func loadImage(_ urlString: String?, placeholder: UIImage? = nil) {
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        loadImage(url, placeholder: placeholder)
    }
}
