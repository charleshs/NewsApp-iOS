//
//  HeadlineContainerViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class HomeContainerViewController: UIViewController {

    let bannerGalleryView = UIView()
    
    let articleListView = UIView()
    
    override func loadView() {
        super.loadView()
        view.addSubviews([bannerGalleryView, articleListView])
        
        bannerGalleryView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 leading: view.safeAreaLayoutGuide.leadingAnchor,
                                 bottom: nil,
                                 trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                 padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 widthConstant: 0,
                                 heightConstant: UIScreen.height / 3)
        
        articleListView.anchor(top: bannerGalleryView.bottomAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor,
                               padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                               widthConstant: 0,
                               heightConstant: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBannerGalleryView()
        setupArticleListView()
    }
    
    private func setupBannerGalleryView() {
        let childVC = BannerGalleryViewController()
        addChild(childVC)
        bannerGalleryView.addSubview(childVC.view)
        childVC.view.fillToSuperview()
        childVC.didMove(toParent: self)
    }
    
    private func setupArticleListView() {
        let childVC = ArticleListViewController(dataProvider: HeadlineProvider(category: .business))
        addChild(childVC)
        articleListView.addSubview(childVC.view)
        childVC.view.fillToSuperview()
        childVC.didMove(toParent: self)
    }
}
