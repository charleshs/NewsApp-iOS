//
//  HTTPService.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

enum HTTPServiceError: Error {
    
    case invalidURL
    case clientError(Data)
    case serverError
    case unexpectedError
}

enum HTTPMethod: String {
    
    case GET
    case POST
}

protocol CSRequest {
    
    var urlString: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}

extension CSRequest {
    
    func makeRequest() throws -> URLRequest {
        guard let url = URL(string: urlString) else {
            throw HTTPServiceError.invalidURL
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        request.httpMethod = method.rawValue
        return request
    }
}


class HTTPService {
    
    static let shared = HTTPService()
    
    private let session: URLSession = {
        let session = URLSession(configuration: .default)
        session.delegateQueue.maxConcurrentOperationCount = 10
        return session
    }()
    
    func request(_ request: CSRequest, completion: @escaping (Result<Data, HTTPServiceError>) -> Void) {
        
        guard let request = try? request.makeRequest() else {
            completion(.failure(.invalidURL))
            return
        }
        let task = session.dataTask(with: request) { (data, response, error) in
            guard
                error == nil,
                let data = data,
                let response = response as? HTTPURLResponse
            else {
                completion(.failure(.unexpectedError))
                return
            }
            switch response.statusCode {
            case 200 ..< 300:
                completion(.success(data))
            case 400 ..< 500:
                completion(.failure(.clientError(data)))
            case 500 ..< 600:
                completion(.failure(.serverError))
            default:
                completion(.failure(.unexpectedError))
            }
        }
        task.resume()
    }
}
