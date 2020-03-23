//
//  AppCoordinator.swift
//  NewsApp
//
//  Created by Charles Hsieh on 2020/2/26.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    weak var window: UIWindow?
    
    init(window: UIWindow?, navController: UINavigationController) {
        self.window = window
        self.navigationController = navController
    }
    
    func start() {
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let homeCoordinator = HomeCoordinator(navController: self.navigationController)
        startChild(homeCoordinator)
    }
    
    func stop() {
        
    }
}
