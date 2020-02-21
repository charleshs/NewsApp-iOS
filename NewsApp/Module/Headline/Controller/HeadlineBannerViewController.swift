//
//  HeadlineBannerViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/21.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class HeadlineBannerViewController: UIViewController {
    
    var headlineItems: [Headline] = [] {
        didSet {
            bannerCollectionView.reloadData()
        }
    }
    
    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.csRegisterCell(classType: HeadlineCell.self)
        collectionView.backgroundColor = .lightGray
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        fetchData()
    }
    
    // MARK: - Private Methods
    private func fetchData() {
        
        APIService().fetchHeadlines { (result) in
            if let headlines = try? result.get() {
                DispatchQueue.main.async {
                    self.headlineItems.append(contentsOf: headlines)
                }
            }
        }
    }
    
    private func setupViews() {
        
        view.backgroundColor = .white
        view.addSubview(bannerCollectionView)
        bannerCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                                    leading: view.safeAreaLayoutGuide.leadingAnchor,
                                    bottom: nil,
                                    trailing: view.safeAreaLayoutGuide.trailingAnchor,
                                    padding: .zero,
                                    widthConstant: 0, heightConstant: 300)
    }
}

// MARK: - UICollectionViewDataSource
extension HeadlineBannerViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return headlineItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeadlineCell.reuseIdentifier, for: indexPath)
        guard let headlineCell = cell as? HeadlineCell else { return cell }
        
        let headline = headlineItems[indexPath.item]
        headlineCell.titleLabel.text = headline.title
        if let url = headline.urlImage {
            headlineCell.imageView.loadImage(url)
        }
        
        return headlineCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HeadlineBannerViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.width, height: 300)
    }
}
