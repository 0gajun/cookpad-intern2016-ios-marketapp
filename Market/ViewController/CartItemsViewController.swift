//
//  CartItemsViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import FontAwesome

class CartItemsViewController: UITableViewController {
    @IBOutlet weak var purchaseButton: UIBarButtonItem!
    
    var items: [CartItem] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabBarItem.image = UIImage.fontAwesomeIconWithName(.ShoppingCart, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.tabBarItem.title = "カート"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.items = CartHolder.get()
        preparePurchaseButton()
    }
    
    private func preparePurchaseButton() {
        if self.items.isEmpty {
            self.purchaseButton.enabled = false
        } else {
            self.purchaseButton.enabled = true
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CartItemCell", forIndexPath: indexPath) as? CartItemCell else {
            fatalError("Invalid Cell")
        }

        let item = items[indexPath.row]
        cell.update(withCartItem: item)
        
        return cell
    }
}
