//
//  CartItem.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation

struct CartItem {
    let id: Int
    let name: String
    let price: Int
    var count: Int
    let imageURL: NSURL
}