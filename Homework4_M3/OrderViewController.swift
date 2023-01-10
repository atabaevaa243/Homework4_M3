//
//  OrderViewController.swift
//  Homework4_M3
//
//  Created by mac on 7/1/23.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderTableView: UITableView!
    
    var emptyArray: [Order] = []
    
    var deliveryButton = UIButton()
    
    var amount = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "order_cell", for: indexPath) as! OrderCell
        cell.orderImageView.image = UIImage(named: emptyArray[indexPath.row].orderImage)
        cell.orderTitleLabel.text = emptyArray[indexPath.row].orderTitle
        cell.orderPriceLabel.text = "\(emptyArray[indexPath.row].orderPrice) сом"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for i in emptyArray{
            amount += i.orderPrice
               }
        
        let totalLabel = UILabel(frame: CGRect(x: 25, y: 700, width: 300, height: 30))
                totalLabel.text = " Итого к оплате: \(amount)"
                totalLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
                totalLabel.textColor = .black

                self.view.addSubview(totalLabel)
        
        view.addSubview(deliveryButton)
        deliveryButton.layer.cornerRadius = 25
        deliveryButton.setTitle("Оформить заказ", for: .normal)
        deliveryButton.backgroundColor = .red
        deliveryButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        deliveryButton.addTarget(self, action: #selector(deliveryButtonTap), for: .touchUpInside )
        
        deliveryButton.translatesAutoresizingMaskIntoConstraints = false
        deliveryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        deliveryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        deliveryButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        deliveryButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
    }
    
    @objc func deliveryButtonTap() {
        let deliveryVc = storyboard?.instantiateViewController(withIdentifier: "delivery_vc") as! DeliveryViewController
        navigationController?.pushViewController(deliveryVc, animated: true)
    }
    
    
}
