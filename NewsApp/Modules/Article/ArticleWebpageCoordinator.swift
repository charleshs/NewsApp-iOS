//
//  ArticleWebpageCoordinator.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/3/23.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class ArticleWebpageCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    private var urlString: String
    
    init(navController: UINavigationController, urlString: String) {
        self.navigationController = navController
        self.urlString = urlString
    }
    
    func start() {
        let articleWebpageVC = ArticleWebpageViewController(urlString: urlString)
        articleWebpageVC.coordinator = self
        navigationController.pushViewController(articleWebpageVC, animated: true)
    }
    
    func stop() {
        navigationController.popViewController(animated: true)
        parentCoordinator?.stopChild(self)
    }
}
