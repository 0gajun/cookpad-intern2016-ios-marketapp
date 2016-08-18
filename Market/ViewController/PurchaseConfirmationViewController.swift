//
//  PurchaseConfirmationViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class PurchaseConfirmationViewController: UIViewController {
    @IBOutlet weak var cartItemsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showDetails()
    }
    
    private func showDetails() {
        let cartItems = CartHolder.get()
        self.cartItemsLabel.text = cartItems.reduce("", combine: { (s, item) -> String in
            s + "\n\(item.name) \(item.price)円 数量: \(item.count)"
        })
        let total = cartItems.reduce(0, combine: { (sum, item) -> Int in sum + item.price })
        self.totalLabel.text = "計: \(total)円"
    }

    @IBAction func doPurchase(sender: AnyObject) {
        
    }
}
