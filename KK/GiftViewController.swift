//
//  FirstViewController.swift
//  KK
//
//  Created by lianghongbin on 7/15/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit

class GiftViewController : UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let numOfPages = 3
    let pageWidth = 320
    let pageHeight = 360
    var tableView : UITableView?
    var gifts:Gift?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.118, green: 0.125, blue: 0.133, alpha: 1.00)
        
        
        self.navigationItem.title = "礼包大全"
        
        var leftButton = UIBarButtonItem(image: UIImage(named: "search"), style: UIBarButtonItemStyle.Plain, target: self, action: "search")
        
        var rightButton = UIBarButtonItem(image: UIImage(named: "select"), style: UIBarButtonItemStyle.Plain, target: self, action: "select")
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        
        initView()
        

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
    
    
    func initView(){
        // 初始化tableView的数据
        self.tableView=UITableView(frame: CGRect(x: 0, y: 266, width: self.view.frame.size.width, height: 4*98), style: UITableViewStyle.Plain)
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        
        // 设置tableView的数据源
        self.tableView!.dataSource=self
        // 设置tableView的委托
        self.tableView!.delegate = self
        //
        self.tableView!.registerClass(GiftCell.self, forCellReuseIdentifier: "giftCell")
        self.view.addSubview(self.tableView!)
    }
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 1
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView .dequeueReusableCellWithIdentifier("giftCell", forIndexPath: indexPath) as! GiftCell
        var row=indexPath.row as Int
        cell.titleLabel?.text = "abcdkkkkk"
        cell.iconImageView?.image = UIImage(named: "first.jpg")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        cell.descLabel?.text = "abcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcd"
        return cell;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
  
        return 98;
    }
}
