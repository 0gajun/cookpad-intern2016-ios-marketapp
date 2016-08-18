//
//  CartItemsViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit

class CartItemsViewController: UITableViewController {
    
    var items: [CartItem] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        items = CartHolder.get()
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
