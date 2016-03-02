//
//  LeftViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        UIApplication.sharedApplication().statusBarHidden = true
//        print("\(self.view.frame)")
        let imageView: UIImageView = UIImageView()
        imageView.frame = self.view.frame
        
        imageView.backgroundColor = UIColor.orangeColor()
        imageView.image = UIImage(named: "videoScreenshot03")
        self.view.addSubview(imageView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
