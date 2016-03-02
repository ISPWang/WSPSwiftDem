//
//  ChatVideoMenuViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ChatVideoMenuViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        let leftVC: LeftViewController   = LeftViewController()
        let rightVC: RightViewController = RightViewController()
        
        let cameraVC: CameraViewController = CameraViewController()
        
        self.addChildViewController(leftVC)
        self.scrollView.addSubview(leftVC.view)
        leftVC.didMoveToParentViewController(self)
        
        
        self.addChildViewController(rightVC)
        self.scrollView.addSubview(rightVC.view)
        rightVC.didMoveToParentViewController(self)
        
        
        self.addChildViewController(cameraVC)
        self.scrollView.addSubview(cameraVC.view)
        cameraVC.didMoveToParentViewController(self)
        
        var centerViewFrame: CGRect = cameraVC.view.frame
        centerViewFrame.origin.x    = self.view.frame.width
        cameraVC.view.frame         = centerViewFrame
        
        
        var rightViewFrame: CGRect = rightVC.view.frame
        rightViewFrame.origin.x    = self.view.frame.width * 2
        rightVC.view.frame         = rightViewFrame
        
        self.scrollView.contentSize                    = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
        self.scrollView.pagingEnabled                  = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator   = false
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
