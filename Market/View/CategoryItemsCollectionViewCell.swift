//
//  CategoryItemsCollectionViewCell.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import WebImage

class CategoryItemsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(withItem item: Item) {
        self.nameLabel.text = item.name
        self.categoryImage.sd_setImageWithURL(item.imageURL)
    }
}
