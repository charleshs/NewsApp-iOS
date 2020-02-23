//
//  UICollectionView+Extension.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    convenience init(direction: ScrollDirection = .vertical,
                     lineSpacing: CGFloat = 0,
                     interitemSpacing: CGFloat = 0,
                     pagingEnabled: Bool = false,
                     bgColor: UIColor = .clear,
                     verticalIndicator: Bool = false,
                     horizontalIndicator: Bool = false) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = direction
        layout.minimumLineSpacing = lineSpacing
        layout.minimumInteritemSpacing = interitemSpacing
        self.init(frame: .zero, collectionViewLayout: layout)
        self.isPagingEnabled = pagingEnabled
        self.backgroundColor = bgColor
        self.showsVerticalScrollIndicator = verticalIndicator
        self.showsHorizontalScrollIndicator = horizontalIndicator
    }
}
