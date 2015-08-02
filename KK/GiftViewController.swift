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
        
        self.view.backgroundColor = viewBackgroundColor
        
        
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
        self.tableView?.backgroundColor = viewBackgroundColor
        let tableViewFooterWidth = self.tableView?.frame.size.width
        var tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableViewFooterWidth!, height: 15))
        tableViewFooter.backgroundColor = viewBackgroundColor
        
        self.tableView?.tableFooterView  = tableViewFooter
        
        var footLabel = UILabel(frame:CGRect(x:0, y:0, width:tableViewFooterWidth!, height:15))
        footLabel.text = "><没有数据了"
        footLabel.font = UIFont(name: "AppleGothic", size: 12)
        footLabel.textColor = UIColor.whiteColor()
        footLabel.textAlignment = NSTextAlignment.Center
        tableViewFooter.addSubview(footLabel)
            
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
        return 2
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView .dequeueReusableCellWithIdentifier("giftCell", forIndexPath: indexPath) as! GiftCell
        var row=indexPath.row as Int
        cell.titleLabel?.text = "我的大标题，哈哈\(row)"
        cell.iconImageView?.image = UIImage(named: "first.jpg")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        cell.descLabel?.text = "我就是想测一下而已我就是想测一下而已我就是想测一下而已我就是想测一下而已我就是想测一下而已我就是想测一下而已"
        cell.typeLabel?.text = "积"
        cell.typeLabel?.backgroundColor = UIColor.orangeColor()
        cell.typeLabel?.textColor = UIColor.whiteColor()
        
        cell.countLabel?.text = "剩余:35%"
        
        cell.progress?.setProgress(0.35, animated: true)
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
  
        return 98;
    }

}
