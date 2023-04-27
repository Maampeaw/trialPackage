//
//  CustomButtonView.swift
//  
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit

class CustomButtonView: UIView {
    let button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        view.setTitle("Pay now", for: .normal)
        view.setTitleColor(.white, for: .normal)
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        self.addSubview(button)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setupConstraints(){
        let views = ["button": button]
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button(50)]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button]-|", metrics: nil, views: views)
        ].flatMap({ $0 }))
    }

}
