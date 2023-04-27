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
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    

}
