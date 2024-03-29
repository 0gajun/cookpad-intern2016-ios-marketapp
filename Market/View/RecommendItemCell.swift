//
//  RecommendItemCell.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import WebImage

class RecommendItemCell: UITableViewCell {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    static let height: CGFloat = 96
    
    func update(withItem item: Item) {
        nameLabel.text = item.name
        priceLabel.text = "\(item.price)円"
        descriptionLabel.text = item.desc
        thumbnailImageView.sd_setImageWithURL(item.imageURL)
    }
}