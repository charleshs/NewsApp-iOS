//
//  BaseNavController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = false
    }
}
