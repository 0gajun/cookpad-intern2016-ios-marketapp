//
//  CartHolder.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation

//TODO: 永続化したらそっちへ

class CartHolder {
    static let holder = CartHolder()
    var cartItems: [CartItem] = []
    
    private init() {
    }
    
    static func get() -> [CartItem] {
        return holder.cartItems
    }
    
    static func add(cartItem: CartItem) {
        if let index = holder.cartItems.indexOf({ $0.id == cartItem.id }) {
            holder.cartItems[index].count += 1
        } else {
            holder.cartItems.append(cartItem)
        }
    }
}