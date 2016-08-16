//
//  ItemDetailsViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit
import WebImage

class ItemDetailsViewController: UIViewController {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addCartButton: UIButton!
    
    var itemID: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "読込中..."
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = ItemRequest(id: itemID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.updateView(response)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func updateView(item: Item) {
        thumbnailImage.sd_setImageWithURL(item.imageURL)
        nameLabel.text = item.name
        descriptionLabel.text = item.desc
        priceLabel.text = "\(item.price)円"
        self.title = item.name
    }
}