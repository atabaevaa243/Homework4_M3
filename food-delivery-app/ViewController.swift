//
//  ViewController.swift
//  Homework4_M3
//
//  Created by mac on 6/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var foodTableView: UITableView!
    
    var food: [Food] = [Food(image: "burger", title: "Гамбургер с курицей", price: 180),
                        Food(image: "cheeseBurger", title: "Чизбургер с говядиной", price: 250),
                        Food(image: "chickenWings", title: "Куриные крылышки 5 штук", price: 380),
                        Food(image: "cola", title: "Кока-кола 0,4 мл", price: 60),
                        Food(image: "fries", title: "Картошка фри стандарт", price: 210),
                        Food(image: "nuggets", title: "Куриные наггетсы 4 штуки", price: 360),
                        Food(image: "panini", title: "Панини острый с курицей", price: 280),
                        Food(image: "sause", title: "Соус сырный", price: 50)
    ]
    
    var addButton = UIButton()
    
    var order: [Order] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 25
        addButton.setTitle("Добавить в корзину \(order.count)", for: .normal)
        addButton.backgroundColor = .red
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside )
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 270).isActive = true
        
        
        foodTableView.showsVerticalScrollIndicator = false
    }

    @objc func addButtonTap() {
        let orderVc = storyboard?.instantiateViewController(identifier: "order_vc") as! OrderViewController
        orderVc.emptyArray = order
        
        navigationController?.pushViewController(orderVc, animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return food.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as! FoodCell
        cell.foodImageView.image = UIImage(named: food[indexPath.row].image)
        cell.foodTitleLabel.text = food[indexPath.row].title
        cell.foodPriceLabel.text = "\(food[indexPath.row].price) сом"
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        order.append(Order(orderImage: food[indexPath.row].image, orderTitle: food[indexPath.row].title, orderPrice: food[indexPath.row].price))
        addButton.setTitle("Добавить в корзину \(order.count)", for: .normal)
    }
}

