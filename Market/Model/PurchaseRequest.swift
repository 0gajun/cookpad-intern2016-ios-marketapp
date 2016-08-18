//
//  PurchaseRequest.swift
//  Market
//
//  Created by junya-ogasawara on 2016/08/18.
//  Copyright © 2016年 COOKPAD inc,. All rights reserved.
//

import Foundation
import APIKit

struct PurchaseRequest: MarketRequestType {
    typealias Response = CartItem
    
    let param: AnyObject?
    
    init(param: AnyObject) {
        self.param = param
    }
    
    var method: HTTPMethod {
        return .POST
    }
    
    var path: String {
        return "/orders"
    }
    
    var bodyParameters: BodyParametersType? {
        guard let parameters = self.param where !method.prefersQueryParameters else {
            return nil
        }
        
        return JSONBodyParameters(JSONObject: parameters)
    }
    
    func responseFromObject(object: AnyObject, URLResponse: NSHTTPURLResponse) throws -> Response {
        // TODO: fix tmp val
        return CartItem(id: 1, name: "hoge", price: 1000, count: 1, imageURL: NSURL(string: "http://google.com")!)
    }
}