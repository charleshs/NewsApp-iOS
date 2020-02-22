//
//  HTTPService.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

enum HTTPServiceError: Error {
    
    case clientError
    case serverError
    case unexpectedError
}

class HTTPService {
    
    static let shared = HTTPService()
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        session.delegateQueue.maxConcurrentOperationCount = 10
        return session
    }()
    
    func request(_ url: URL, completion: @escaping (Result<Data, HTTPServiceError>) -> Void) {
        
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil, let data = data, let response = response as? HTTPURLResponse else {
                completion(.failure(.unexpectedError))
                return
            }
            
            switch response.statusCode {
            case 200 ..< 300:
                completion(.success(data))
            case 400 ..< 500:
                completion(.failure(.clientError))
            case 500 ..< 600:
                completion(.failure(.serverError))
            default:
                completion(.failure(.unexpectedError))
            }
//            debugPrint(response.statusCode)
            
        }.resume()
    }
}
