//
//  GameViewController.swift
//  KK
//
//  Created by lianghongbin on 7/17/15.
//  Copyright (c) 2015 lianghongbin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.118, green: 0.125, blue: 0.133, alpha: 1.00)
        
        self.navigationItem.title = "小游戏"
        
        let label = UILabel(frame: CGRect(x: 0, y: 80, width: 300, height: 35))
        label.text = "Second View"
        
        self.view.addSubview(label)
    }
}