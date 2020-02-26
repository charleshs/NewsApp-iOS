//
//  Headline.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

struct Headline: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url, content
        case urlImage = "urlToImage"
        case published = "publishedAt"
    }
    
    var source: Source?
    var author: String?
    var title: String
    var description: String?
    var url: String?
    var urlImage: String?
    var published: String
    var content: String?
    
    var dateString: String {
        let inputFormatter = DateManager.shared.sourceDateFormatter
        guard let date = inputFormatter.date(from: published) else { return self.published }
        let outputFormatter = DateManager.shared.outputDateFormatter
        return outputFormatter.string(from: date)
    }
}

