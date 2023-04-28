//
//  CustomTextField.swift
//  
//
//  Created by Mark Amoah on 4/28/23.
//

import UIKit

class CustomTextField: UITextField {
    let padding = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.systemGray
    }
   

}
