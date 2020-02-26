//
//  BannerGalleryViewModel.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/2/27.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

protocol BannerGalleryViewModelProtocol {
    
    var title: String { get }
    var postLink: String { get }
    var imageLink: String { get }
}

class BannerGalleryViewModel: BannerGalleryViewModelProtocol {
    
    static func mapping(_ headlines: [Headline]) -> [BannerGalleryViewModel] {
        
        return headlines.map { headline in
            BannerGalleryViewModel(headline)
        }.compactMap { $0 }
    }
    
    var title: String
    var postLink: String
    var imageLink: String
    
    init?(_ headline: Headline) {
        guard
            let title = headline.title,
            let postLink = headline.url,
            let imageLink = headline.urlImage else {
                return nil
        }
        self.title = title
        self.postLink = postLink
        self.imageLink = imageLink
    }
}
