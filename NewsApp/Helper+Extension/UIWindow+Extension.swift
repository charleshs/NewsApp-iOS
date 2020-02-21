//
//  UIWindow+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/17.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

extension UIWindow {
    
    var visibleViewController: UIViewController? {
        
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    static func getVisibleViewControllerFrom(_ viewController: UIViewController?) -> UIViewController? {
        
        if let navController = viewController as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(navController.visibleViewController)
            
        } else if let tabBarController = viewController as? UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tabBarController.selectedViewController)
            
        } else if let presentedVC = viewController?.presentedViewController {
            return UIWindow.getVisibleViewControllerFrom(presentedVC)
            
        } else {
            return viewController
        }
    }
}
