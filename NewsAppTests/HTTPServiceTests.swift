//
//  HTTPServiceTests.swift
//  NewsAppTests
//
//  Created by Charles Hsieh on 2020/3/23.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import XCTest
@testable import NewsApp

class HTTPServiceTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testRequest_validURL_shouldGetData() {
        
        let promise = expectation(description: "Test HTTPService")
        
        HTTPService.shared.request(StubRequest()) { result in
            switch result {
            case .success(let data):
                promise.fulfill()
                
            case .failure(let error):
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
        
        wait(for: [promise], timeout: 5.0)
    }
}

struct StubRequest: CSRequest {
    
    let urlString: String = "https://httpbin.org/"
    
    let method: HTTPMethod = .GET
    
    let headers: [String : String] = [:]
    
    var body: Data? = nil
}
