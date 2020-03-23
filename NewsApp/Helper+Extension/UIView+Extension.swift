//
//  UIView+Extension.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/10.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

// MARK: - Properties
extension UIView {
    
    var parentViewController: UIViewController? {
        
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }
    
    // swiftlint:disable identifier_name
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }
    // swiftlint:enable identifier_name
}

// MARK: - Methods
extension UIView {
    
    class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
        
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func addSubviews(_ subviews: [UIView]) {
        
        subviews.forEach { addSubview($0) }
    }
    
    func removeSubviews() {
        
        subviews.forEach({ $0.removeFromSuperview() })
    }

    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0),
                   radius: CGFloat = 3,
                   offset: CGSize = .zero,
                   opacity: Float = 0.5) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func fillToSuperview() {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let top = topAnchor.constraint(equalTo: superview.topAnchor)
            let leading = leadingAnchor.constraint(equalTo: superview.leadingAnchor)
            let trailing = trailingAnchor.constraint(equalTo: superview.trailingAnchor)
            let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            NSLayoutConstraint.activate([top, leading, trailing, bottom])
        }
    }
    
    func fillToSafeArea() {
        
        guard let guide = superview?.safeAreaLayoutGuide else { return }
        
        anchor(top: guide.topAnchor, leading: guide.leadingAnchor, bottom: guide.bottomAnchor, trailing: guide.trailingAnchor, padding: .zero, widthConstant: 0, heightConstant: 0)
    }
    
    @discardableResult
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        padding: UIEdgeInsets,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: padding.top))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: padding.left))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -padding.right))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    func anchorSuperview(equalPadding padding: CGFloat) {
        
        anchorSuperview(padding: UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding))
    }
    
    func anchorSuperview(padding: UIEdgeInsets) {
        
        guard let superview = superview else { return }
        
        anchor(top: superview.topAnchor, leading: superview.leadingAnchor,
               bottom: superview.bottomAnchor, trailing: superview.trailingAnchor,
               padding: padding, widthConstant: 0, heightConstant: 0)
    }
    
    func anchorCenterXToSuperview(constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    func anchorCenterYToSuperview(constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    
    func anchorCenterSuperview() {
        
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
    func ancestorView(where predicate: (UIView?) -> Bool) -> UIView? {
        
        if predicate(superview) {
            return superview
        }
        return superview?.ancestorView(where: predicate)
    }
    
    func ancestorView<T: UIView>(withClass name: T.Type) -> T? {
        
        return ancestorView(where: { $0 is T }) as? T
    }
}
