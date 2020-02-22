//
//  CellRegistrator.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/10.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

protocol CellRegistrator: AnyObject {
    
    static var nib: UINib { get }
    
    static var reuseIdentifier: String { get }
}

extension CellRegistrator {
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellRegistrator { }

extension UITableViewHeaderFooterView: CellRegistrator { }

extension UICollectionReusableView: CellRegistrator { }

extension UITableView {
    
    func csRegisterHeaderFooter<T: UITableViewHeaderFooterView>(classType name: T.Type) {
        
        register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func csNibRegisterHeaderFooter<T: UITableViewHeaderFooterView>(nibClassType name: T.Type) {
        
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func csRegisterCell<T: UITableViewCell>(classType name: T.Type) {
        
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func csNibRegisterCell<T: UITableViewCell>(nibClassType name: T.Type) {
        
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
}

extension UICollectionView {
    
    func csRegisterCell<T: UICollectionViewCell>(classType name: T.Type) {
        
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func csNibRegisterCell<T: UICollectionViewCell>(nibClassType name: T.Type) {
        
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func csRegisterReusableView<T: UICollectionReusableView>(classType name: T.Type, of kind: String) {
        
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func csNibRegisterReusableView<T: UICollectionReusableView>(nibClassType name: T.Type, of kind: String) {
        
        register(T.nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
}
