//
//  JsonWrapper.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import ObjectMapper

class JsonWrapper<T: Mappable> : Mappable {
    
    var status:Status?
    var data:T?
    
    class func newInstance() -> Mappable {
        return JsonWrapper<T>()
    }
    
    // Mappable
    func mapping(map: Map) {
        status          <- map["status"]
        data            <- map["data"]
    }
}
