//
//  GiftCell.swift
//  KK
//
//  Created by lianghongbin on 15/7/31.
//  Copyright (c) 2015年 lianghongbin. All rights reserved.
//

import UIKit
import SnapKit

class GiftCell: UITableViewCell {
    
    var bgView:UIView?
    var lineView:UIView?
    var iconImageView:UIImageView?
    var titleLabel:UILabel?
    var descLabel:UILabel?
    var typeLabel:UILabel?
    var countLabel:UILabel?
    var progress:UIProgressView?
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        self.bgView = UIView()
        self.bgView?.backgroundColor = barTintColor
        self.addSubview(bgView!)
        bgView?.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 4, 0))
        }
        
        lineView = UIView()
        //lineView?.backgroundColor = UIColor(red: 0.11, green: 0.13, blue: 0.14, alpha: 1)
        lineView?.backgroundColor = UIColor.redColor()

        self.addSubview(lineView!)
        lineView?.snp_makeConstraints({ (make) -> Void in
            make.left.equalTo(self).offset(0)
            make.right.equalTo(self).offset(0)
            make.bottom.equalTo(self).offset(-3)
            make.height.equalTo(1)
        })
        
        weak var weakBgView = bgView
        iconImageView = UIImageView()
        iconImageView?.backgroundColor = UIColor.clearColor()
        iconImageView?.layer.masksToBounds = true
        iconImageView?.layer.cornerRadius = 18
        self.bgView!.addSubview(iconImageView!)
        iconImageView?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(10)
            make.left.equalTo(weakBgView!).offset(10)
            make.size.equalTo(CGSizeMake(75, 75))
        })
        
        weak var weakIconView = iconImageView;
        titleLabel = UILabel()
        titleLabel?.textColor = UIColor.whiteColor()
        titleLabel?.font = UIFont(name: "AppleGothic", size: 16)
        self.bgView?.addSubview(titleLabel!)
        titleLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(11)
            make.left.equalTo(weakIconView!.snp_right).offset(8)
            make.right.equalTo(weakBgView!).offset(-50)
            make.height.equalTo(20)
        })
        
        descLabel = UILabel()
        descLabel?.textColor = UIColor(red: 0.382, green: 0.588, blue: 0.667, alpha: 1)
        descLabel?.numberOfLines = 0
        descLabel?.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        descLabel?.font = UIFont(name: "AppleGothic", size: 12)
        self.bgView?.addSubview(descLabel!)
        descLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(30)
            make.left.equalTo(weakIconView!.snp_right).offset(8)
            make.bottom.equalTo(weakBgView!).offset(-15)
            make.height.equalTo(40)
        })
        
    }
}