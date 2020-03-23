//
//  HeadlineProvider.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

class HeadlineProvider {
    
    private let request: HeadlineRequest
    
    private let apiService: NewsAPIService
    
    init(category: SubCategory) {
        self.request = .init(category: category)
        self.apiService = .init(request: request)
    }
    
    func fetchHeadlines(completion: @escaping (Result<[Headline], Error>) -> Void) {
        
        apiService.executeRequest(completion: completion)
    }
}
