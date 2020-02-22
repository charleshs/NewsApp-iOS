//
//  HeadlineParser.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
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
