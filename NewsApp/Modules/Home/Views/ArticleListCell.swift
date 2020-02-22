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
                            textAlignment: .left,
                            numberOfLines: 2)
        return label
    }()
    
    private let descLabel: UILabel = {
       let label = UILabel(text: "",
                           font: .systemFont(ofSize: 14, weight: .regular),
                           textColor: .lightGray,
                           textAlignment: .left,
                           numberOfLines: 3)
        return label
    }()
    
    private let edgePadding: CGFloat = 8
    private let contentPadding: CGFloat = 4
    
    override func commonInit() {
        super.commonInit()
        
        contentView.addSubviews([titleLabel, descLabel])
        titleLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor,
                          bottom: descLabel.topAnchor, trailing: contentView.trailingAnchor,
                          padding: UIEdgeInsets(top: edgePadding, left: edgePadding, bottom: contentPadding, right: edgePadding),
                          widthConstant: 0, heightConstant: 0)
        descLabel.anchor(top: nil, leading: contentView.leadingAnchor,
                         bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: edgePadding, bottom: edgePadding, right: edgePadding),
                         widthConstant: 0, heightConstant: 0)
    }
    
    func updateCell(_ headline: Headline) {
        titleLabel.text = headline.title
        descLabel.text = headline.description
    }
}
