//
//  HeadlineRequest.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

struct HeadlineRequest {
    
    var requestURL: URL? {
        var params: [String: String] = [
            "country": "tw",
            "apiKey": apiKey,
        ]
        if category != .none {
            params["category"] = category.rawValue
        }
        let queryString = makeQueryString(params)
        let urlString = baseUrl + queryString
        return URL(string: urlString)
    }
    
    private let baseUrl = "https://newsapi.org/v2/top-headlines?"
    
    private let category: SubCategory
    
    private var apiKey: String {
        guard
            let path = Bundle.main.path(forResource: "NewsAPI", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path),
            let apiKey = dict["APIKey"] as? String
            else { return "" }
        return apiKey
    }
    
    init(category: SubCategory) {
        self.category = category
    }
    
    private func makeQueryString(_ params: [String: String]) -> String {
        
        var queryStrings: [String] = []
        for (key, value) in params {
            queryStrings.append("\(key)=\(value)")
        }
        return queryStrings.joined(separator: "&")
    }
}
