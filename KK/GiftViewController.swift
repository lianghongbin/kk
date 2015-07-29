//
//  FirstViewController.swift
//  KK
//
//  Created by lianghongbin on 7/15/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit

class GiftViewController : UIViewController {
    
    let numOfPages = 3
    let pageWidth = 320
    let pageHeight = 360
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.118, green: 0.125, blue: 0.133, alpha: 1.00)
        
        
        self.navigationItem.title = "礼包大全"
        
        var leftButton = UIBarButtonItem(image: UIImage(named: "search"), style: UIBarButtonItemStyle.Plain, target: self, action: "search")
        
        var rightButton = UIBarButtonItem(image: UIImage(named: "select"), style: UIBarButtonItemStyle.Plain, target: self, action: "select")
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        

        //scroll view
        self.automaticallyAdjustsScrollViewInsets = false
        var imageArray: [UIImage!] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg")]
        
        var circleView = CircleView(frame: CGRectMake(0, 64+2, self.view.frame.size.width, 200), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(circleView)
    }
    
    func search() {
        println("search")
    }
    
    func select() {
        println("select")
    }
}
