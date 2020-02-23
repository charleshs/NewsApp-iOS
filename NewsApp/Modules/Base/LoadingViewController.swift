//
//  LoadingViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    private lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.color = .red
        view.hidesWhenStopped = true
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .init(white: 0.1, alpha: 1.0)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.anchorSuperview(padding:
            .init(top: 0, left: 0, bottom: UIScreen.height / 2, right: 0))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicatorView.startAnimating()
    }
}
