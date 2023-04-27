//
//  CheckoutViewController.swift
//  
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit

public class CheckoutViewController: UIViewController {
    
    public static func openController(with customController: UIViewController){
        let controller = CheckoutViewController()
        customController.present(controller, animated: true)
    }
    let bottomButton: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        self.view.addSubview(bottomButton)
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["bottomButton": bottomButton]
        //Setup bottom constraints for button
        let buttonConstraints = [NSLayoutConstraint.constraints(withVisualFormat: "H:|[bottomButton]|", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomButton]-|", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(buttonConstraints)
        
    }
    

}
