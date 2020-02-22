//
//  ArticleListViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {

    var headlineItems: [Headline] = [] {
        didSet {
            listTableView.reloadData()
        }
    }
    
    private var dataProvider: HeadlineProvider?
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.csRegisterCell(classType: ArticleListCell.self)
        tableView.backgroundColor = .black
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(dataProvider: HeadlineProvider) {
        self.init()
        self.dataProvider = dataProvider
    }
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        view.addSubview(listTableView)
        listTableView.fillToSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    private func fetchData() {
        guard let dataProvider = dataProvider else { return }
        
        dataProvider.fetchHeadlines { [weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let headlines):
                self?.headlineItems = headlines
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return headlineItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:ArticleListCell.reuseIdentifier,
                                                 for: indexPath)
        guard let articleCell = cell as? ArticleListCell else { return cell }
        let headline = headlineItems[indexPath.item]
        articleCell.updateCell(headline)
        return articleCell
    }
}

// MARK: - UITableViewDelegate
extension ArticleListViewController:  UITableViewDelegate {
    
}
