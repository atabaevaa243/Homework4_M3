//
//  OrderCellTableViewCell.swift
//  Homework4_M3
//
//  Created by mac on 11/1/23.
//

import UIKit

class OrderCell: UITableViewCell {

    @IBOutlet weak var orderImageView: UIImageView!
    
    @IBOutlet weak var orderTitleLabel: UILabel!
    
    @IBOutlet weak var orderPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        orderTitleLabel.numberOfLines = 2
        orderTitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        orderPriceLabel.textColor = .gray
        orderPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    }

}
