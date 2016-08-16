//
//  CategoryCell.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//


import UIKit
import WebImage

class CategoryCell: UITableViewCell {
    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let height: CGFloat = 60
    
    func update(withCategory category: Category) {
        nameLabel.text = category.name
        
        thumbnailView.sd_setImageWithURL(category.imageUrl)
    }
}