//
//  GiftDelegate.swift
//  KK
//
//  Created by lianghongbin on 15/8/3.
//  Copyright (c) 2015年 lianghongbin. All rights reserved.
//

import UIKit
import ObjectMapper

protocol CellDelegate {
    
    func reloadTable(data:Mappable)
}
