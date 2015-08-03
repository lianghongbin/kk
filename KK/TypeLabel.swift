//
//  TypeLabel.swift
//  KK
//
//  Created by lianghongbin on 15/8/3.
//  Copyright (c) 2015年 lianghongbin. All rights reserved.
//

import UIKit

class TypeLabel {
    
    var label:UILabel?
    
    func initial(type:String) {
        switch type{
            case "SCORE":
                label?.text = "积"
                label?.backgroundColor = UIColor.orangeColor()
                label?.textColor = UIColor.whiteColor()
            break
            case "FREE":
                label?.text = "免"
                label?.backgroundColor = UIColor.blueColor()
                label?.textColor = UIColor.yellowColor()
            break
            case "PAY":
                label?.text = "付"
                label?.backgroundColor = UIColor.greenColor()
                label?.textColor = UIColor.blueColor()
            break
        default:
            label?.text = "免"
            label?.backgroundColor = UIColor.blueColor()
            label?.textColor = UIColor.yellowColor()
        }
    }
}
