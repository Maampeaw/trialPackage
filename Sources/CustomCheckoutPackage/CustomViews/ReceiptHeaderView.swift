//
//  ReceiptHeaderView.swift
//  
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit

class ReceiptHeaderView: UIView {
    
    //top information of the receipt
    let businessImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let businessName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MTN Mobile Money"
        return label
    }()
    
    let recipientNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0556236739"
        return label
    }()
    
    lazy var businessInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [businessName, recipientNumber])
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        return stack
    }()
    
    lazy var topHeaderStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [businessImage, businessInfoStack])
        stack.axis = .horizontal
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        return stack
    }()
    
    //middle stack of the receipt
    let amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Amount"
        return label
    }()
    
    let amountValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GHS 12.00"
        label.textAlignment = .right
        return label
    }()
    
    lazy var amountStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel, amountValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    let feesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "fees"
        return label
    }()
    
    let feesValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GHS 0.00"
        label.textAlignment = .right
        return label
    }()
    
    lazy var feesStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel, amountValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    let taxLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tax"
        return label
    }()
    
    let taxValue: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GHS 1.00"
        label.textAlignment = .right
        return label
    }()
    
    lazy var taxStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountLabel, amountValue])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    lazy var middleStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [amountStack, feesStack, taxStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 16)
        stack.spacing = 8
        return stack
    }()
    
    
    //yellow bottom stack of the receipt
    let chargeInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalAmount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chargeInfo, totalAmount])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.directionalLayoutMargins  = NSDirectionalEdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0)
        return stack
    }()
    
    lazy var mainStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topHeaderStack, middleStack, bottomStack])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainStack)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        let views = ["mainStack": mainStack]
        let imageSizeConstraints = [businessImage.heightAnchor.constraint(equalToConstant: 50), businessImage.widthAnchor.constraint(equalToConstant: 50)]
        let mainStackConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|[mainStack]|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[mainStack]|", metrics: nil, views: views)
        ].flatMap { $0 }
        NSLayoutConstraint.activate(mainStackConstraints)
    }
    
}