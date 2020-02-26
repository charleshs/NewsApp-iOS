//
//  HomeCoordinator.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    init(navController: UINavigationController) {
        self.navigationController = navController
    }
    
    func start() {
        
        let homeContainerVC = HomeContainerViewController()
        navigationController.viewControllers = [homeContainerVC]
    }
}
