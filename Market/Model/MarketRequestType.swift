//
//  MarketRequestType.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import APIKit

protocol MarketRequestType: RequestType {}

extension MarketRequestType {
    var baseURL: NSURL {
        return NSURL(string: "http://localhost:3000")!
    }
}