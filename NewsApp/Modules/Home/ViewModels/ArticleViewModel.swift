//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/2/27.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

protocol ArticleViewModelProtocol {
    
    var title: String { get }
    var description: String { get }
    var dateString: String { get }
    var sourceName: String { get }
    var postLink: String { get }
}

class ArticleViewModel: ArticleViewModelProtocol {

    static func mapping(_ headlines: [Headline]) -> [ArticleViewModel] {
        
        return headlines.map { headline in
            ArticleViewModel(headline)
        }.compactMap { $0 }
    }
    
    var title: String
    var description: String
    var dateString: String
    var sourceName: String
    var postLink: String
    
    init?(_ headline: Headline) {
        guard
            let description = headline.description,
            let sourceName = headline.source?.name,
            let postLink = headline.url else {
                return nil
        }
        self.title = headline.title
        self.description = description
        self.dateString = headline.dateString
        self.sourceName = sourceName
        self.postLink = postLink
    }
    
}
