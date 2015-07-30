//
//  NetRespository.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import SwiftHTTP
import ObjectMapper

class NetRespository {
    
    var jsonWrapper:JsonWrapper<Gift>?
    var a:Int?
    
    func requestHttp(urlString: String) {
        
        var request = HTTPTask()
        request.GET(urlString, parameters: nil, completionHandler: handler)
        
        println(jsonWrapper?.data?.icon)
        println(a)
    }
    
    func handler(response : HTTPResponse) {
        if let err = response.error {
            println("error: \(err.localizedDescription)")
            return //also notify app of failure as needed
        }
        if let data = response.responseObject as? NSData {
            let str = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("response: \(str)") //prints the HTML of the page
            
            jsonWrapper = Mapper<JsonWrapper<Gift>>().map(str!)
        }
        
        a = 10
    }
}