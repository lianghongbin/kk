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
    
    func request(urlString: String) -> JsonWrapper<Gift> {
        
        var jsonWrapper:JsonWrapper<Gift>?
        var httpRequest = HTTPTask()
        httpRequest.GET(urlString, parameters: nil, completionHandler: {(response: HTTPResponse) in
            if let err = response.error {
                println("error: \(err.localizedDescription)")
                return //also notify app of failure as needed
            }
            if let data = response.responseObject as? NSData {
                println(data)
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response: \(str!)") //prints the HTML of the page
                
                jsonWrapper = Mapper<JsonWrapper<Gift>>().map(str!)
            }
        })
        
        return jsonWrapper!
    }
}