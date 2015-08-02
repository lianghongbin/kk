//
//  Handler.swift
//  KK
//
//  Created by 宏彬 梁 on 8/2/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit

public protocol Handler {
    
    typealias T:UITableViewCell
    
    mutating func handle(cell:T, index:Int) -> Void
}