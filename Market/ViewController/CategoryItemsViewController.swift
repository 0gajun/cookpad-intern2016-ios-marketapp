//
//  CategoryItemsViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

private let reuseIdentifier = "CategoryItemsCollectionViewCell"

class CategoryItemsViewController: UICollectionViewController {
    
    var items: [Item] = [] {
        didSet {
            self.collectionView?.reloadData()
        }
    }
    
    var categoryID: Int = 0
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController!.tabBarItem.image = UIImage.fontAwesomeIconWithName(.Github, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let request = CategoryItemsRequest(categoryId: self.categoryID)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                self.items = response
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CategoryItemsCollectionViewCell else {
            fatalError("Invalid Cell")
        }
        
        let item = items[indexPath.row]
        cell.update(withItem: item)
        // TODO: 影をどうにかしてうまくつける
        // TODO: セルの幅計算して、いい感じに並べる
    
        return cell
    }
    
    var indexPath: NSIndexPath? = nil

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? ItemDetailsViewController {
            // FIXME: だめそう？
            guard let selectedIndexPath = self.collectionView?.indexPathsForSelectedItems()![0] else {
                return
            }
            let item = items[selectedIndexPath.row]
            destination.itemID = item.id
        }
    }
}

