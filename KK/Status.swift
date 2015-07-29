//
//  Status.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import ObjectMapper

class Status : Mappable {
    
    var code:Int?
    var message:String?
    
    class func newInstance() -> Mappable {
        return Status()
    }
    
    // Mappable
    func mapping(map: Map) {
        code       <- map["code"]
        message    <- map["message"]
    }
}
