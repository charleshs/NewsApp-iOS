//
//  CategoryCell.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class CategoryCell: BaseCollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            categoryLabel.textColor = isSelected ? .red : .white
        }
    }
    
    private let categoryLabel = UILabel(text: "",
                                        font: .systemFont(ofSize: 14, weight: .medium),
                                        textColor: .white,
                                        textAlignment: .center,
                                        numberOfLines: 1)
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        
        var targetSize = targetSize
        targetSize.width = CGFloat.greatestFiniteMagnitude
        let size = super.systemLayoutSizeFitting(targetSize,
                                                 withHorizontalFittingPriority: .fittingSizeLevel,
                                                 verticalFittingPriority: .required)
        return size
    }
    
    override func commonInit() {
        super.commonInit()
        
        contentView.fillToSuperview()
        contentView.addSubview(categoryLabel)
        categoryLabel.fillToSuperview()
    }
    
    func setCategory(text: String) {
        categoryLabel.text = text
    }
}
