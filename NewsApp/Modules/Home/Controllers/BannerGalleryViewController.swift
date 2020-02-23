//
//  BannerGalleryViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class BannerGalleryViewController: BaseViewController {
    
    var headlineItems: [Headline] = [] {
        didSet {
            bannerCollectionView.reloadData()
        }
    }
    
    private lazy var bannerCollectionView: UICollectionView = {
        let collectionView = UICollectionView(direction: .horizontal, lineSpacing: 0, interitemSpacing: 0, pagingEnabled: true, bgColor: .clear)
        collectionView.csRegisterCell(classType: BannerGalleryCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    // MARK: - Private Methods
    private func fetchData() {
        
        let dataProvider = HeadlineProvider(category: .none)
        
        dataProvider.fetchHeadlines { [weak self] result in
            
            switch result {
            case .failure(let error):
                print(error)
                
            case .success(let headlines):
                self?.headlineItems = headlines
            }
        }
    }
    
    private func setupViews() {
        
        view.addSubview(bannerCollectionView)
        bannerCollectionView.fillToSuperview()
    }
}

// MARK: - UICollectionViewDataSource
extension BannerGalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return headlineItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:BannerGalleryCell.reuseIdentifier,
                                                      for: indexPath)
        guard let headlineCell = cell as? BannerGalleryCell else { return cell }
        let headline = headlineItems[indexPath.item]
        headlineCell.updateCell(headline)
        return headlineCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension BannerGalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.width, height: collectionView.height)
    }
}
