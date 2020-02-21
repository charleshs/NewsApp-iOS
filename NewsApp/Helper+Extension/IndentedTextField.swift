//
//  IndentedTextField.swift
//  CSLibrary
//
//  Created by Kai-Ta Hsieh on 2020/2/17.
//  Copyright © 2020 Kai-Ta Hsieh. All rights reserved.
//

import UIKit

class IndentedTextField: UITextField {
    
    let padding: CGFloat
    
    public init(placeholder: String? = nil,
                padding: CGFloat = 0,
                cornerRadius: CGFloat = 0,
                keyboardType: UIKeyboardType = .default,
                backgroundColor: UIColor = .clear,
                isSecureTextEntry: Bool = false) {
        
        self.padding = padding
        super.init(frame: .zero)
        self.placeholder = placeholder
        layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required init?(coder: NSCoder) {
        self.padding = 8
        super.init(coder: coder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: padding, dy: 0)
    }
}
