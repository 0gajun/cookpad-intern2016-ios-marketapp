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
    
    private init() {
    }
    
    static func get() -> CartHolder {
        return holder
    }
    
    var cartItems: [CartItem] = []
    
    
}