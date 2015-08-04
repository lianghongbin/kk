//
//  FirstViewController.swift
//  KK
//
//  Created by lianghongbin on 7/15/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit
import ObjectMapper
import Kingfisher
import ICSPullToRefresh

class GiftViewController : UIViewController,UITableViewDelegate, UITableViewDataSource, CellDelegate {
    
    let numOfPages = 3
    let pageWidth = 320
    let pageHeight = 360
    var tableView : UITableView?
    var typeLabel = TypeLabel()
    var gifts:Array<Gift> = []
    let myCache = ImageCache(name: "lhb_kk_cache")
    var refreshControl:UIRefreshControl!
    var repository:NetRepository<JsonArrayWrapper<Gift>>?
    var url:String = "http://kk.7k7k.com/1_0/card/recommend?pagesize=10&pagenum=1&platform=ALL&searchType=0&token=45f3b67195bbd1087caa77b11478e0d1"
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        initScrollView()
        initTable()
        repository = NetRepository<JsonArrayWrapper<Gift>>()
        repository?.delegate = self
        
        loadData()
        initRefresh()
    }
    
    func search() {
        println("search")
    }
    
    func select() {
        println("select")
    }
    
    func initView() {
        self.view.backgroundColor = viewBackgroundColor
        self.navigationItem.title = "礼包大全"
        var leftButton = UIBarButtonItem(image: UIImage(named: "search"), style: UIBarButtonItemStyle.Plain, target: self, action: "search")
        var rightButton = UIBarButtonItem(image: UIImage(named: "select"), style: UIBarButtonItemStyle.Plain, target: self, action: "select")
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func initScrollView() {
        //scroll view
        self.automaticallyAdjustsScrollViewInsets = false
        var imageArray: [UIImage!] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg")]
        var circleView = CircleView(frame: CGRectMake(0, 64+2, self.view.frame.size.width, 200), imageArray: imageArray)
        circleView.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(circleView)
    }
    
    func initTable(){
        // 初始化tableView的数据
        self.tableView=UITableView(frame: CGRect(x: 0, y: 266, width: self.view.frame.size.width, height: 4*98), style: UITableViewStyle.Plain)
        self.tableView?.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView?.backgroundColor = viewBackgroundColor
        let tableViewFooterWidth = self.tableView?.frame.size.width
        var tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableViewFooterWidth!, height: 15))
        tableViewFooter.backgroundColor = viewBackgroundColor
        
        self.tableView?.tableFooterView  = tableViewFooter
        
        var footLabel = UILabel(frame:CGRect(x:0, y:0, width:tableViewFooterWidth!, height:15))
        footLabel.text = "><  没有数据啦"
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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.tableView?.addInfiniteScrollingWithHandler {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                dispatch_async(dispatch_get_main_queue(), { [unowned self] in
                    
                    self.loadData()
                    self.tableView?.infiniteScrollingView?.stopAnimating()
                    })
            })
        }
    }
    
    //总行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return gifts.count
    }
    
    //加载数据
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView .dequeueReusableCellWithIdentifier("giftCell", forIndexPath: indexPath) as! GiftCell
        var row=indexPath.row as Int
        var gift = gifts[row]
        
        cell.titleLabel?.text = gift.name
        
        cell.iconImageView?.kf_setImageWithURL(NSURL(string: gift.icon!)!,
            placeholderImage: nil,
            optionsInfo: [.TargetCache: myCache])
        
        cell.descLabel?.text = gift.description
        
        typeLabel.label = cell.typeLabel
        typeLabel.initial(gift.type!)
        
        var percent:Float?
        if (gift.total == nil || gift.total==0) {
            percent = 0
        }
        else if (gift.assignTotal == nil) {
            percent = 1
        }
        else {
            percent = Float(gift.total!-gift.assignTotal!)/Float(gift.total!)
        }
        
        var intPercent:Int = Int(percent!*100)
        cell.countLabel?.text = "剩余:\(intPercent)%"
        cell.progress?.setProgress(percent!, animated: true)
        
        return cell;
        
    }
    
    // UITableViewDelegate 方法，处理列表项的选中事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.tableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        var gift = gifts[indexPath.row]
        
        var alertview = UIAlertView();
        alertview.title = "提示!"
        alertview.message = "你选中了【\(gift.name)】";
        alertview.addButtonWithTitle("确定")
        alertview.show();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //返回Cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 98;
    }

    func reloadTable(data: Mappable) {
        println("request complete")
        if let jsonArrayWrapper = data as? JsonArrayWrapper<Gift> {
            self.gifts = jsonArrayWrapper.data!
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
                dispatch_async(dispatch_get_main_queue(), { [unowned self] in
                    
                    self.tableView?.reloadData()
                    })
            })

        }
    }
    
    func loadData() {
        println("load data")
        repository?.requestHttp(url)
    }
    
    func pullRefresh() {
        loadData()
        refreshControl?.endRefreshing()
    }
    
    func initRefresh() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        self.refreshControl.tintColor = UIColor.whiteColor()
        self.refreshControl.addTarget(self, action: "pullRefresh", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView!.addSubview(refreshControl)
    }
    
    func pullLoad() {
    
    }
}
