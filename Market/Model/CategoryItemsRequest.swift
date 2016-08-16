//
//  CategoryItemsRequest.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/16.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation
import APIKit
import Himotoki

struct CategoryItemsRequest: MarketRequestType {
    typealias Response = [Item]
    
    let categoryId: Int
    
    init(categoryId: Int) {
        self.categoryId = categoryId
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var path: String {
        return "/categories/\(categoryId)/items.json"
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        return try decodeArray(object)
    }
}