//
//  BottomCornersTableViewCell.swift
//  
//
//  Created by Mark Amoah on 4/28/23.
//

import UIKit

class BottomCornersTableViewCell: UITableViewCell {
    static let identifier: String = "bottomCorners"
    let customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    lazy var parentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [customView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.backgroundColor = .white
        layer.cornerRadius = 16
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMinYCorner]
        return stack
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(parentStack)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["parentStack": parentStack]
        customView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        let stackConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[parentStack]-|", metrics: nil, views: views),NSLayoutConstraint.constraints(withVisualFormat: "V:|[parentStack]|", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(stackConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}