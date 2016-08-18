//
//  CartItemCell.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import WebImage

class CartItemCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    func update(withCartItem item: CartItem) {
        self.thumbnailImageView.sd_setImageWithURL(item.imageURL)
        self.nameLabel.text = item.name
        self.priceLabel.text = "\(item.price)円"
        self.amountLabel.text = "数量:\(item.count)個"
    }
}
