//
//  CategoryBrowserViewController.swift
//  NewsApp
//
//  Created by Kai-Ta Hsieh on 2020/2/22.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

protocol CategoryBrowserViewControllerDelegate: AnyObject {
    
    func didSelectCategory(_ controller: CategoryBrowserViewController, with category: SubCategory)
}

class CategoryBrowserViewController: UIViewController {
    
    weak var delegate: CategoryBrowserViewControllerDelegate?
    
    private let cellPadding: CGFloat = 16
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = self.cellPadding
        layout.minimumLineSpacing = self.cellPadding
        layout.sectionInset = UIEdgeInsets(top: 0, left: self.cellPadding,
                                           bottom: 0, right: self.cellPadding)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsMultipleSelection = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.csRegisterCell(classType: CategoryCell.self)
        return collectionView
    }()
    
    private let items: [SubCategory] = [
        .none, .business, .entertainment, .health, .science, .technology, .sports
    ]
    
    // MARK: - ViewController Life Cycle
    override func loadView() {
        super.loadView()
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollectionView.selectItem(at: IndexPath(item: 0, section: 0),
                                          animated: true,
                                          scrollPosition: .centeredHorizontally)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let flowLayout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 200, height: view.height)
        }
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(categoryCollectionView)
        categoryCollectionView.fillToSuperview()
    }
}

// MARK: - UICollectionViewDataSource
extension CategoryBrowserViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier,
                                                      for: indexPath)
        guard let categoryCell = cell as? CategoryCell else { return cell }
        categoryCell.setCategory(text: items[indexPath.item].localizedTitle)
        return categoryCell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CategoryBrowserViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        let category = items[indexPath.item]
        delegate?.didSelectCategory(self, with: category)
    }
}
