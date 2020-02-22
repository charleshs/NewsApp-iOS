//
//  ArticleListCell.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class ArticleListCell: BaseTableViewCell {

    private let titleLabel: UILabel = {
        let label = UILabel(text: "",
                            font: .systemFont(ofSize: 16, weight: .heavy),
                            textColor: .white,
                            numberOfLines: 2)
        return label
    }()
    
    private let descLabel: UILabel = {
       let label = UILabel(text: "",
                           font: .systemFont(ofSize: 14, weight: .regular),
                           textColor: .lightGray,
                           numberOfLines: 3)
        return label
    }()
    
    private let datetimeLabel: UILabel = {
       let label = UILabel(text: "",
                           font: .systemFont(ofSize: 14, weight: .regular),
                           textColor: .lightGray)
        return label
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel(text: "",
                            font: .systemFont(ofSize: 14, weight: .regular),
                            textColor: .lightGray)
        return label
    }()
    
    private let edgePadding: CGFloat = 12
    private let verticalSpacing: CGFloat = 8
    
    override func commonInit() {
        super.commonInit()
        
        let hStack = UIStackView(arrangedSubviews: [datetimeLabel, UIView(), sourceLabel])
        hStack.axis = .horizontal
        hStack.distribution = .fill
        
        let vStack = UIStackView(arrangedSubviews: [titleLabel, descLabel, hStack])
        vStack.axis = .vertical
        vStack.distribution = .equalSpacing
        vStack.spacing = verticalSpacing
        
        contentView.addSubview(vStack)
        vStack.anchorSuperview(equalPadding: edgePadding)
    }
    
    func updateCell(_ headline: Headline) {
        titleLabel.text = headline.title
        descLabel.text = headline.description
        datetimeLabel.text = headline.published
        sourceLabel.text = headline.source?.name
    }
}
