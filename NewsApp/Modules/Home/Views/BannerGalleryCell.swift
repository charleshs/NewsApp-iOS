//
//  BannerGalleryCell.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class BannerGalleryCell: BaseCollectionViewCell {
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        layer.locations = [0.7, 1.0]
        return layer
    }()
    
    let imageView: UIImageView = UIImageView(image: nil)
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "",
                            font: .systemFont(ofSize: 16, weight: .heavy),
                            textColor: .white,
                            textAlignment: .left,
                            numberOfLines: 2)
        return label
    }()

    override func commonInit() {
        super.commonInit()
        
        contentView.addSubview(imageView)
        imageView.fillToSuperview()
        
        contentView.layer.addSublayer(gradientLayer)
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: nil,
                          leading: contentView.leadingAnchor,
                          bottom: contentView.bottomAnchor,
                          trailing: contentView.trailingAnchor,
                          padding: UIEdgeInsets(top: 0, left: 8, bottom: 8, right: 8),
                          widthConstant: 0,
                          heightConstant: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentView.bounds
    }
    
    func updateCell(_ viewModel: BannerGalleryViewModelProtocol) {
        imageView.loadImage(viewModel.imageLink)
        titleLabel.text = viewModel.title
    }
}
