//
//  BaseViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    weak var coordinator: Coordinator?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .init(white: 0.1, alpha: 1.0)
        setBackButtonImage(ImageAsset.navArrowBack.getImage())
    }
    
    @objc public func back(_ sender: UIBarButtonItem) {
        
    }
    
    private func setBackButtonImage(_ image: UIImage?) {
        let barButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(back(_:)))
        navigationItem.leftBarButtonItem = barButton
    }
}
