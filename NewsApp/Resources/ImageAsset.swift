//
//  ImageAssets.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/3/23.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

enum ImageAsset: String {
    case navArrowBack
    
    func getImage() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
