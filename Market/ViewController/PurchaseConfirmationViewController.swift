//
//  PurchaseConfirmationViewController.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import UIKit
import APIKit

class PurchaseConfirmationViewController: UIViewController {
    @IBOutlet weak var cartItemsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var cartItems: [CartItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showDetails()
    }
    
    private func showDetails() {
        self.cartItems = CartHolder.get()
        self.cartItemsLabel.text = cartItems.reduce("", combine: { (s, item) -> String in
            s + "\n\(item.name) \(item.price)円 数量: \(item.count)"
        })
        let total = cartItems.reduce(0, combine: { (sum, item) -> Int in sum + item.price })
        self.totalLabel.text = "計: \(total)円"
    }

    @IBAction func doPurchase(sender: AnyObject) {
        let requestBody = ["line_items" : self.cartItems.map({ ["item_id" : $0.id, "quantity" : $0.count] })]
        
        let request = PurchaseRequest(param: requestBody)
        
        Session.sendRequest(request) { result in
            switch (result) {
            case .Success(_):
                self.showSuccessAlert()
                self.onPostSuccessPurchase()
            case .Failure(_):
                self.showFailureAlert()
            }
        }
    }
    
    private func onPostSuccessPurchase() {
        CartHolder.clear()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    private func showSuccessAlert() {
        showAlert( "購入しました")
    }
    
    private func showFailureAlert() {
        showAlert("購入に失敗しました")
    }
    
    private func showAlert(msg: String) {
        // FIXME: Deprecatedだが諦める
        let alert = UIAlertView.init(title: "", message: msg, delegate: nil, cancelButtonTitle: "閉じる")
        alert.show()
    }
}
