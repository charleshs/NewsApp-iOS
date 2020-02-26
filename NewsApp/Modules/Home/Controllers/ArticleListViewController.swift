//
//  ArticleListViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

protocol ArticleListViewControllerDelegate: AnyObject {
    
    func didSelectItem(_ controller: ArticleListViewController, article: ArticleViewModelProtocol)
}

class ArticleListViewController: BaseViewController {

    weak var delegate: ArticleListViewControllerDelegate?
    
    var articleItems: [ArticleViewModelProtocol] = [] {
        didSet {
            listTableView.reloadData()
        }
    }
    
    var dataProvider: HeadlineProvider! {
        didSet {
            fetchData()
        }
    }
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(style: .plain, separatorStyle: .none, bgColor: .clear)
        tableView.csRegisterCell(classType: ArticleListCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
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
                self?.articleItems = ArticleViewModel.mapping(headlines)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ArticleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return articleItems.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCell.reuseIdentifier,
                                                 for: indexPath)
        guard let articleCell = cell as? ArticleListCell else { return cell }
        let article = articleItems[indexPath.item]
        articleCell.updateCell(article)
        return articleCell
    }
}

// MARK: - UITableViewDelegate
extension ArticleListViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = self.articleItems[indexPath.row]
        delegate?.didSelectItem(self, article: article)
    }
}
