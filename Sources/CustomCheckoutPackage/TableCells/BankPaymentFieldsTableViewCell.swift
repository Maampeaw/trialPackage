//
//  BankPaymentFieldsTableViewCell.swift
//  
//
//  Created by Mark Amoah on 4/28/23.
//

import UIKit

class BankPaymentFieldsTableViewCell: UITableViewCell {
    
    static let identifier: String = "BankPaymentCell"
    
    let accountNumberTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let dobTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let cvvTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var parentContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubviews(accountNumberTextField, dobTextField, cvvTextField)
        return container
    }()
    
    lazy var parentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [parentContainer])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        contentView.backgroundColor = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255,alpha:1)
        contentView.addSubview(parentStack)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        let views = ["accountNumberfield":accountNumberTextField, "dobfield": dobTextField, "cvvfield": cvvTextField, "stack": parentStack]
        let buttonWidth = (UIScreen.main.bounds.width - 80)/2
        let accountNumberTextFieldConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[accountNumberfield(50)]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[accountNumberfield]|", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(accountNumberTextFieldConstraints)
        
        let dobTextFieldConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[dobfield(\(buttonWidth))]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[accountNumberfield]-(16)-[dobfield(50)]", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(dobTextFieldConstraints)
        
        let cvvTextFieldConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:[cvvfield(\(buttonWidth))]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[accountNumberfield]-(16)-[cvvfield(50)]", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(cvvTextFieldConstraints)
        
        let parentStackConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[stack]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[stack]-|", metrics: nil, views: views)
        ]
        NSLayoutConstraint.activate(parentStackConstraints)
        
    }
}
