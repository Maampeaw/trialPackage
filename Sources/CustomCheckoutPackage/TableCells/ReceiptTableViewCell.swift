//
//  ReceiptTableViewCell.swift
//  
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit

class ReceiptTableViewCell: UITableViewCell {
    static let identifier = "ReceiptTableViewCell"
    
    let receiptView: ReceiptHeaderView = {
        let view = ReceiptHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 32, leading: 32, bottom: 32, trailing: 32)
    }
    
    func setupConstraints(){
        let views = ["receiptView": receiptView]
        let receiptConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[receiptView]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[receiptView]-|", metrics: nil, views: views)].flatMap {$0}
        NSLayoutConstraint.activate(receiptConstraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
