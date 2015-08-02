//
//  JsonArrayWrapper.swift
//  KK
//
//  Created by 宏彬 梁 on 8/2/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import ObjectMapper

class JsonArrayWrapper<T: Mappable> : Mappable {
    
    var status:Status?
    var data:[T]?
    
    class func newInstance() -> Mappable {
        return JsonArrayWrapper<T>()
    }
    
    // Mappable
    func mapping(map: Map) {
        status          <- map["status"]
        data            <- map["data"]
    }
}
