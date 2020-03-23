//
//  APIService.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

class NewsAPIService {
    
    private var headlineRequest: HeadlineRequest
    
    init(request: HeadlineRequest) {
        self.headlineRequest = request
    }
    
    func executeRequest(completion: @escaping (Result<[Headline], Error>) -> Void) {
        
        HTTPService.shared.request(headlineRequest) { (result) in
            
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            case .success(let data):
                do {
                    let parsedResult = try JSONDecoder().decode(HeadlineParser.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(parsedResult.articles))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
