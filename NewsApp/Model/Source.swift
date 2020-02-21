//
//  Source.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

struct Source: Decodable {
    
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        
    }
}
