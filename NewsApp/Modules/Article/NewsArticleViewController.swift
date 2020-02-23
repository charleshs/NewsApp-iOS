//
//  NewsArticleViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit
import WebKit

class NewsArticleViewController: BaseViewController {

    private lazy var articleTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private var headline: Headline!
    
    convenience init(headline: Headline) {
        self.init()
        self.headline = headline
    }
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(articleTableView)
        articleTableView.fillToSafeArea()
    }
}

extension NewsArticleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return .init()
    }
}

extension NewsArticleViewController: UITableViewDelegate {
    
}
