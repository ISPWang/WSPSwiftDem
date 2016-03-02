//
//  ShareStyleDemoViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit
import CircleMenu

class ShareStyleDemoViewController: UIViewController, CircleMenuDelegate {

    // 元祖
    let items: [(icon: String, color: UIColor)] = [
        ("avatar_grassroot", UIColor(red:0.19, green:0.57, blue:1, alpha:1)),
        ("avatar_vgirl", UIColor(red:0.26, green:0.13, blue:0.21, alpha:1)),
        ("avatar_vip", UIColor(red:0.22, green:0.74, blue:0, alpha:1)),
        ("avatar_enterprise_vip", UIColor(red:1, green:0.39, blue:0, alpha:1)),
        ("camera_video_download", UIColor(red:0.51, green:0.15, blue:1, alpha:1)),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(colorLiteralRed: 15/255.0, green: 20.0/255.0, blue: 39.0/255.0, alpha: 1.0)
        
        let button = CircleMenu(
            frame: CGRect(x: 150, y: 200, width: 50, height: 50),
            normalIcon:"icon_menu",
            selectedIcon:"icon_close",
            buttonsCount: 5,
            duration: 2,
            distance: 100)
        button.backgroundColor = UIColor.lightGrayColor()
        button.delegate = self
        button.layer.cornerRadius = button.frame.size.width / 2.0
        view.addSubview(button)
    }
    // MARK: <CircleMenuDelegate>
    
    func circleMenu(circleMenu: CircleMenu, willDisplay button: CircleMenuButton, atIndex: Int) {
        button.backgroundColor = items[atIndex].color
        button.setImage(UIImage(imageLiteral: items[atIndex].icon), forState: .Normal)
        
        // set highlited image
        let highlightedImage  = UIImage(imageLiteral: items[atIndex].icon).imageWithRenderingMode(.AlwaysTemplate)
        button.setImage(highlightedImage, forState: .Highlighted)
        button.tintColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func circleMenu(circleMenu: CircleMenu, buttonWillSelected button: CircleMenuButton, atIndex: Int) {
        print("button will selected: \(atIndex)")
    }
    
    func circleMenu(circleMenu: CircleMenu, buttonDidSelected button: CircleMenuButton, atIndex: Int) {
        print("button did selected: \(atIndex)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
