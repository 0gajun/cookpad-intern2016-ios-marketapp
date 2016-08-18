//
//  CategoryViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class CategoryViewController: UITableViewController {
    
    var categories: [Category] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabBarItem.image = UIImage.fontAwesomeIconWithName(.Book, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        self.tabBarItem.title = "カテゴリ"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoriesRequest()
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.categories = response
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("CategoryCell", forIndexPath: indexPath) as? CategoryCell else {
            fatalError("Invalid Cell")
        }

        let category = self.categories[indexPath.row]
        cell.update(withCategory: category)

        return cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? CategoryItemsViewController {
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let category = self.categories[selectedIndexPath.row]
            destination.categoryID = category.id
        }
    }
}
