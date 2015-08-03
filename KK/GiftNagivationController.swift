//
//  GiftNagivationController.swift
//  KK
//
//  Created by 宏彬 梁 on 7/28/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit

class GiftNagivationController: UINavigationController {
    
    override func viewDidLoad() {
        
        self.tabBarItem.title = nil
        self.tabBarItem.image = UIImage(named: "gift")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: "gift_select")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        self.tabBarItem.imageInsets = insets
        self.navigationBar.barTintColor = viewBackgroundColor
        self.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        var giftView = GiftViewController()
        
        //line view
        var lineView = UIView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: 2))
        lineView.backgroundColor = UIColor(red: 0, green: 0.62, blue: 1, alpha: 1)
        
        giftView.view.addSubview(lineView)
        
        
        self.viewControllers = [giftView]
    }
}
