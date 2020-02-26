//
//  HeadlineContainerViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class HomeContainerViewController: BaseViewController {

    private let bannerGalleryView = UIView()
    private let categoryBrowserView = UIView()
    private let articleListView = UIView()
    
    private weak var articleListViewController: ArticleListViewController?
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBannerGalleryView()
        setupCategoryBrowserView()
        setupArticleListView()
        showLoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubviews([bannerGalleryView, categoryBrowserView, articleListView])
        
        bannerGalleryView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                 leading: view.safeAreaLayoutGuide.leadingAnchor,
                                 bottom: nil,
                                 trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                 padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                 widthConstant: 0,
                                 heightConstant: UIScreen.height / 3)
        
        categoryBrowserView.anchor(top: bannerGalleryView.bottomAnchor,
                                     leading: view.safeAreaLayoutGuide.leadingAnchor,
                                     bottom: nil,
                                     trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                     padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                                     widthConstant: 0,
                                     heightConstant: 40)
        
        articleListView.anchor(top: categoryBrowserView.bottomAnchor,
                               leading: view.safeAreaLayoutGuide.leadingAnchor,
                               bottom: view.safeAreaLayoutGuide.bottomAnchor,
                               trailing: view.safeAreaLayoutGuide.trailingAnchor,
                               padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                               widthConstant: 0,
                               heightConstant: 0)
    }
    
    private func setupBannerGalleryView() {
        let childVC = BannerGalleryViewController()
        addChild(childVC)
        bannerGalleryView.addSubview(childVC.view)
        childVC.view.fillToSuperview()
        childVC.didMove(toParent: self)
    }
    
    private func setupCategoryBrowserView() {
        let childVC = CategoryBrowserViewController()
        childVC.delegate = self
        addChild(childVC)
        categoryBrowserView.addSubview(childVC.view)
        childVC.view.fillToSuperview()
        childVC.didMove(toParent: self)
    }
    
    private func setupArticleListView() {
        let childVC = ArticleListViewController(dataProvider: HeadlineProvider(category: .none))
        childVC.delegate = self
        addChild(childVC)
        articleListView.addSubview(childVC.view)
        childVC.view.fillToSuperview()
        childVC.didMove(toParent: self)
        self.articleListViewController = childVC
    }
    
    private func showLoadingView() {
        let loadingVC = LoadingViewController()
        addChild(loadingVC)
        view.addSubview(loadingVC.view)
        loadingVC.didMove(toParent: self)
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0.8, options: .curveEaseInOut, animations: {
            loadingVC.view.alpha = 0
        }) { _ in
            loadingVC.willMove(toParent: nil)
            loadingVC.view.removeFromSuperview()
            loadingVC.removeFromParent()
        }
    }
}

extension HomeContainerViewController: CategoryBrowserViewControllerDelegate {
    
    func didSelectCategory(_ controller: CategoryBrowserViewController, with category: SubCategory) {
        guard let articleListVC = self.articleListViewController else { return }
        articleListVC.dataProvider = HeadlineProvider(category: category)
    }
}

extension HomeContainerViewController: ArticleListViewControllerDelegate {
    
    func didSelectItem(_ controller: ArticleListViewController, article: ArticleViewModelProtocol) {
        
    }
}
