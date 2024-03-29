//
//  RecommendItemsViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//
import UIKit
import APIKit

class RecommendItemsViewController: UITableViewController {
    
    var items: [Item] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabBarItem.image = UIImage.fontAwesomeIconWithName(.Star, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.tabBarItem.title = "おすすめ"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.tabBarItem.image = UIImage.fontAwesomeIconWithName(.Github, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        tableView.estimatedRowHeight = RecommendItemCell.height
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        let request = RecommendItemsRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.items = response
            case .Failure(let error):
                print(error)
            }
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("RecommendItemCell", forIndexPath: indexPath) as? RecommendItemCell else {
            fatalError("Invalid Cell")
        }

        let item = items[indexPath.row]
        cell.update(withItem: item)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ItemDetailsViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let item = items[selectedIndexPath.row]
            destination.itemID = item.id
        }
    }
}
