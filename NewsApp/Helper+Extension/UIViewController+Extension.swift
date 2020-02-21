//
//  UIViewController+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Add a child viewController to this controller
    func add(_ child: UIViewController) {
        
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    /// Remove a viewController from its parent controller
    func remove() {
        
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
