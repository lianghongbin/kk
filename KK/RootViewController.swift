//
//  ViewController.swift
//  SwiftInAction-008-018
//
//  Created by zhihua on 14-7-7.
//  Copyright (c) 2014年 ucai. All rights reserved.
//
import UIKit

class RootViewController: UITabBarController {
    
    let insets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
    let barTintColor = UIColor(red: 0.118, green: 0.125, blue: 0.133, alpha: 1.00)
    let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let nav1 = UINavigationController()
        nav1.tabBarItem.title = nil
        nav1.tabBarItem.image = UIImage(named: "gift")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav1.tabBarItem.selectedImage = UIImage(named: "gift_select")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav1.tabBarItem.imageInsets = insets
        nav1.navigationBar.barTintColor = barTintColor
        nav1.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        
        
        var gift = GiftViewController()
        nav1.viewControllers = [gift]
        
        let nav2 = UINavigationController()
        nav2.tabBarItem.title = nil
        nav2.tabBarItem.image = UIImage(named: "rank")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav2.tabBarItem.selectedImage = UIImage(named: "rank_select")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav2.tabBarItem.imageInsets = insets
        nav2.navigationBar.barTintColor = barTintColor
        nav2.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        var rank = RankViewController()
        nav2.viewControllers = [rank]
        
        let nav3 = UINavigationController()
        nav3.tabBarItem.title = nil
        nav3.tabBarItem.image = UIImage(named: "game")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav3.tabBarItem.selectedImage = UIImage(named: "game_select")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav3.tabBarItem.imageInsets = insets
        nav3.navigationBar.barTintColor = barTintColor
        nav3.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        var game = GameViewController()
        nav3.viewControllers = [game]
        
        let nav4 = UINavigationController()
        nav4.tabBarItem.title = nil
        nav4.tabBarItem.image = UIImage(named: "me")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav4.tabBarItem.selectedImage = UIImage(named: "me_select")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        nav4.tabBarItem.imageInsets = insets
        nav4.navigationBar.barTintColor = barTintColor
        nav4.navigationBar.titleTextAttributes = titleDict as [NSObject : AnyObject]
        
        var my = MyViewController()
        nav4.viewControllers = [my]
        
        

        //self.tabBar.clipsToBounds = true
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    override func viewWillLayoutSubviews()
    {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , I think the default value is around 50 px, below lowers the tabbar and above increases the tab bar size
        self.tabBar.barTintColor = UIColor(red: 0.118, green: 0.125, blue: 0.133, alpha: 1.00)
        self.tabBar.translucent = false
    }
    
}

