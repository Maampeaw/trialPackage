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
        backgroundColor = UIColor(red: 156.0/255, green: 171.0/255, blue: 184.0/255,alpha:1)
        layer.cornerRadius = 8
    }
   

}
