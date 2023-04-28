//
//  PaymentChoiceTableViewCell.swift
//  
//
//  Created by Mark Amoah on 4/28/23.
//

import UIKit

class PaymentChoiceTableViewCell: UITableViewCell {
    static let identifier: String = "paymentChoiceTableCell"
    let paymentType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let selectionCircle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor(red: 1/255, green: 199.0/255, blue: 177.0/255, alpha: 1).cgColor
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 10
        return view
    }()
    
    let carret: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "chevron.forward")
        }else{
            imageView.image = UIImage(named: "darkHeroImage1")
        }
        return imageView
    }()
    
    lazy var parentContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubviews(selectionCircle, paymentType, carret)
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        return view
    }()
    
    lazy var parentStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [parentContainer])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.backgroundColor = .white
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        contentView.addSubview(parentStack)
        contentView.backgroundColor = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255,alpha:1)
        selectionStyle = .none
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        let views = ["sectionCircle": selectionCircle, "paymentType": paymentType, "carret":carret, "parentStack": parentStack]
        
        let sectionCircleConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[sectionCircle(20)]", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[sectionCircle(20)]-|", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(sectionCircleConstraints)
        
        let paymentTypeLabelConstraints = [paymentType.centerYAnchor.constraint(equalTo: selectionCircle.centerYAnchor), paymentType.leadingAnchor.constraint(equalTo: selectionCircle.trailingAnchor, constant: 16)]
        NSLayoutConstraint.activate(paymentTypeLabelConstraints)
        
        let carretConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:[carret(24)]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[carret(24)]-|", metrics: nil, views: views)
        ].flatMap {$0}
        
        NSLayoutConstraint.activate(carretConstraints)
        
        let stackViewConstraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[parentStack]-|", metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|[parentStack]|", metrics: nil, views: views)
        ].flatMap {$0}
        NSLayoutConstraint.activate(stackViewConstraints)
        
    }
    
    func render(with value: Section){
        self.paymentType.text = value.title
    }
    
    func  turnImage(){
        UIView.animate(withDuration: 0.1) {
            self.carret.transform = CGAffineTransform(rotationAngle: 90 * .pi/180)
            self.selectionCircle.layer.borderWidth = 6
        } completion: { _ in
        }

       
    }
    
    func revert(){
        UIView.animate(withDuration: 0.1) {
            self.carret.transform = .identity
            self.selectionCircle.layer.borderWidth = 3
        } completion: { _ in
            
        }
    }
    
    

}
