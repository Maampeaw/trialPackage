//
//  CheckoutViewController.swift
//  
//
//  Created by Mark Amoah on 4/27/23.
//

import UIKit

enum CellStyles{
    case receiptHeader
    case payWithTitle
    case momoHeader
    case momoInputs
    case bankCardsHeader
    case bankCardInputs
}

struct Section{
    let title, imageName: String
    var options: [Option] = []
    let cellStyle: CellStyles
    var  isOpened: Bool = false
    
}

struct Option{
    let title, image: String
    let cellStyle: CellStyles
}
public class CheckoutViewController: UIViewController {
    
    var data: [Section] = [ Section(title: "", imageName: "", cellStyle: .receiptHeader),
                            Section(title: "Pay with", imageName: "", options:[],  cellStyle: .payWithTitle)
    ]
    
    public static func openController(with customController: UIViewController){
        let controller = CheckoutViewController()
        controller.modalPresentationStyle = .overFullScreen
        customController.present(controller, animated: true)
    }
    let bottomButton: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255,alpha:1)
        return table
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242.0/255, green: 242.0/255, blue: 242.0/255,alpha:1)
        self.view.addSubview(bottomButton)
        self.view.addSubview(tableView)
        tableView.register(ReceiptTableViewCell.self, forCellReuseIdentifier: ReceiptTableViewCell.identifier)
        tableView.register(PayWithTableViewCell.self, forCellReuseIdentifier: PayWithTableViewCell.identifier)
        setupConstraints()
    }
    
    func setupConstraints(){
        let views = ["bottomButton": bottomButton, "tableView": tableView]
        //Setup bottom constraints for button
        let buttonConstraints = [NSLayoutConstraint.constraints(withVisualFormat: "H:|[bottomButton]|", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "V:[bottomButton]|", metrics: nil, views: views)].flatMap{$0}
        NSLayoutConstraint.activate(buttonConstraints)
        
        //setup table Constraints
        
        let tableViewConstraints = [NSLayoutConstraint.constraints(withVisualFormat: "V:|-[tableView][bottomButton]", metrics: nil, views: views), NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", metrics: nil, views: views)
        ].flatMap{$0}
        NSLayoutConstraint.activate(tableViewConstraints)
        
    }
    

}


extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = data[indexPath.section]
        if indexPath.row == 0{
            switch section.cellStyle{
            case .payWithTitle:
                let cell = tableView.dequeueReusableCell(withIdentifier: PayWithTableViewCell.identifier) as! PayWithTableViewCell
                return cell
            case .receiptHeader:
                let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptTableViewCell.identifier) as! ReceiptTableViewCell
                return cell
                
            default:
                return UITableViewCell()
            }
        }
        return UITableViewCell()
    }
    
    
}
