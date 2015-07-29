//
//  Gift.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import ObjectMapper

class Gift : Mappable {
    
    var id:Int?
    var name:String?
    var icon:String?
    var description:String?
    var type:String?
    var total:Int?
    var assignTotal:Int?
    
    class func newInstance() -> Mappable {
        return Gift()
    }
    
    // Mappable
    func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        icon            <- map["icon"]
        description     <- map["description"]
        type            <- map["type"]
        total           <- map["total"]
        assignTotal     <- map["assigntotal"]
    }
}