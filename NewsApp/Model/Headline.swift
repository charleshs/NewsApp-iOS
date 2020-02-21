//
//  Headline.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

struct HeadlineParser: Decodable {
    
    var status: String
    var totalResults: Int
    var articles: [Headline]
    
    enum CodingKeys: String, CodingKey {
        case status, totalResults, articles
    }
}

struct Headline: Decodable {
    
    var source: Source
    var author: String?
    var title: String
    var description: String
    var url: URL?
    var urlImage: URL?
    var published: String
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, content
        case urlImage = "urlToImage"
        case published = "publishedAt"
    }
}

