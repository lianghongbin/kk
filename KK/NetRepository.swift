//
//  NetRespository.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import SwiftHTTP
import ObjectMapper

class NetRepository<T:Mappable> {
    
    var delegate:CellDelegate?
    
    func requestHttp(urlString: String) {

        var request = HTTPTask()
        request.GET(urlString, parameters: nil, completionHandler: {(response: HTTPResponse) in
            if let err = response.error {
                println("error: \(err.localizedDescription)")
                return //also notify app of failure as needed
            }
            if let data = response.responseObject as? NSData {
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                let jsonWrapper = Mapper<T>().map(str!)
                self.delegate!.reloadTable(jsonWrapper!)
            }
            
        })
    
    }
}