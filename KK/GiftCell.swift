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
        self.bgView?.backgroundColor = viewBackgroundColor
        self.addSubview(bgView!)
        bgView?.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        
        lineView = UIView()
        lineView?.backgroundColor = UIColor(red: 0.114, green: 0.133, blue: 0.145, alpha: 1)
        //lineView?.backgroundColor = UIColor.redColor()

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
        titleLabel?.sizeToFit()
        self.bgView?.addSubview(titleLabel!)
        titleLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(10)
            make.left.equalTo(weakIconView!.snp_right).offset(8)
            make.right.lessThanOrEqualTo(weakBgView!).offset(-50)
            make.height.equalTo(20)
        })
        
        typeLabel = UILabel()
        typeLabel?.font = UIFont(name: "AppleGothic", size: 16)
        typeLabel?.textAlignment = NSTextAlignment.Center
        typeLabel?.layer.masksToBounds = true
        typeLabel?.layer.cornerRadius = 4
        self.bgView?.addSubview(typeLabel!)
        typeLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(10)
            make.left.equalTo(titleLabel!.snp_right).offset(8)
            make.width.equalTo(20)
            make.height.equalTo(18)
        })
        
        
        descLabel = UILabel()
        descLabel?.textColor = UIColor(red: 0.382, green: 0.588, blue: 0.667, alpha: 1)
        descLabel?.numberOfLines = 0
        descLabel?.lineBreakMode = .ByWordWrapping
        descLabel?.font = UIFont(name: "AppleGothic", size: 12)
        self.bgView?.addSubview(descLabel!)
        descLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.top.equalTo(weakBgView!).offset(30)
            make.left.equalTo(weakIconView!.snp_right).offset(8)
            make.right.equalTo(weakBgView!).offset(-8)
            make.height.equalTo(40)
        })
        
        countLabel = UILabel()
        countLabel?.textColor = UIColor(red: 0.382, green: 0.588, blue: 0.667, alpha: 1)
        countLabel?.font = UIFont(name: "AppleGothic", size: 12)
        self.bgView?.addSubview(countLabel!)
        countLabel?.snp_makeConstraints({ (make) -> Void in
            
            make.left.equalTo(weakIconView!.snp_right).offset(8)
            make.bottom.equalTo(weakIconView!.snp_bottom).offset(3)
        })
        
        progress = UIProgressView()
        progress?.layer.masksToBounds = true
        progress?.layer.cornerRadius = 5
        progress?.tintColor = UIColor(red: 0, green: 0.608, blue: 0.925, alpha: 1)
        progress?.trackTintColor = UIColor(red: 0.12, green: 0.13, blue: 0.14, alpha: 1)
        
        self.bgView?.addSubview(progress!)
        progress?.snp_makeConstraints({ (make) -> Void in
            
            make.left.equalTo(countLabel!.snp_right).offset(8)
            make.bottom.equalTo(weakIconView!.snp_bottom).offset(0)
            make.right.equalTo(bgView!).offset(-25)
            make.height.equalTo(10)
        })
    }
}