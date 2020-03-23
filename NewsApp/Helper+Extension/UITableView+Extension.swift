//
//  UITableView+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/11.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

// MARK: - Properties
extension UITableView {
    
    var indexPathForLastRow: IndexPath? {
        
        guard let lastSection = lastSection else { return nil }
        return indexPathForLastRow(inSection: lastSection)
    }

    var lastSection: Int? {
        
        return numberOfSections > 0 ? numberOfSections - 1 : nil
    }
}

// MARK: - Methods
extension UITableView {
    
    convenience init(style: UITableView.Style = .plain,
                     separatorStyle: UITableViewCell.SeparatorStyle = .none,
                     bgColor: UIColor = .clear) {
        self.init(frame: .zero, style: style)
        self.separatorStyle = separatorStyle
        self.backgroundColor = bgColor
    }
    
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        
        guard numberOfSections > 0, section >= 0 else { return nil }
        guard numberOfRows(inSection: section) > 0  else {
            return IndexPath(row: 0, section: section)
        }
        return IndexPath(row: numberOfRows(inSection: section) - 1, section: section)
    }
    
    func reloadData(_ completion: @escaping () -> Void) {
        
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion()
        })
    }
    
    func removeTableHeaderView() {
        tableHeaderView = nil
    }
    
    func removeTableFooterView() {
        tableFooterView = nil
    }
    
    func scrollToBottom(animated: Bool = true) {
        
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    func scrollToTop(animated: Bool = true) {
        
        setContentOffset(CGPoint.zero, animated: animated)
    }
    
    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
}
