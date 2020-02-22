//
//  SubCategory.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import Foundation

enum SubCategory: String {
    
    case none
    case business
    case entertainment
    case health
    case science
    case sports
    case technology
    
    var localizedTitle: String {
        switch self {
        case .none:
            return "焦點頭條"
        case .business:
            return "商業金融"
        case .entertainment:
            return "影視娛樂"
        case .health:
            return "健康生活"
        case .science:
            return "科學新知"
        case .sports:
            return "體育運動"
        case .technology:
            return "數位科技"
        }
    }
}
