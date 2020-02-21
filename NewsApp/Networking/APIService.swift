//
//  APIService.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

class APIService {
    
    var url: URL? {
        let base = "https://newsapi.org/v2/top-headlines?country=tw&apiKey="
        guard let path = Bundle.main.path(forResource: "NewsAPI", ofType: "plist"),
            let dict = NSDictionary(contentsOfFile: path),
            let apiKey = dict["APIKey"] as? String else { return nil }
        
        return URL(string: base + apiKey)
    }
    
    func fetchHeadlines(completion: @escaping (Result<[Headline], Error>) -> Void) {
        
        guard let url = url else { return }
        
        HTTPService.shared.request(url: url) { (result) in
            
            switch result {
            case .failure(let error):
                completion(.failure(error))
                
            case .success(let data):
                do {
                    let parsedResult = try JSONDecoder().decode(HeadlineParser.self, from: data)
                    completion(.success(parsedResult.articles))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
}
