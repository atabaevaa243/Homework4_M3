//
//  FoodCell.swift
//  Homework4_M3
//
//  Created by mac on 6/1/23.
//

import Foundation
import UIKit

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var foodTitleLabel: UILabel!
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    override func awakeFromNib() {
        foodTitleLabel.numberOfLines = 2
        foodTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        foodPriceLabel.textColor = .gray
        foodPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)

    }
}
