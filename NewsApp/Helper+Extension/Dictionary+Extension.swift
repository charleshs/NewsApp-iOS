//
//  Dictionary+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/17.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func decode<T: Codable>(as type: T.Type) throws -> T {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            let result = try JSONDecoder().decode(T.self, from: jsonData)
            return result
        } catch {
            throw error
        }
    }
}
