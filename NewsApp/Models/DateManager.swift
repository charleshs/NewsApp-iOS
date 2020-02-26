//
//  DateManager.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/2/27.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

class DateManager {
    
    static let shared = DateManager()
    
    private let dateFormatter: DateFormatter = DateFormatter()
    
    private init() { }
    
    var sourceDateFormatter: DateFormatter {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }
    
    var outputDateFormatter: DateFormatter {
        dateFormatter.dateFormat = "HH:mm  dd MMM'.' yyyy"
        return dateFormatter
    }
}
