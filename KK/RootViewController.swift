//
//  ViewController.swift
//  SwiftInAction-008-018
//
//  Created by zhihua on 14-7-7.
//  Copyright (c) 2014年 ucai. All rights reserved.
//
import UIKit

class RootViewController: UITabBarController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let nav1 = GiftNagivationController()
        
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
        self.tabBar.barTintColor = barTintColor
        self.tabBar.translucent = false
    }
    
}

