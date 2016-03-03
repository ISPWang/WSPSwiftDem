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
        
        let leftVC:   LeftViewController     = LeftViewController()
        let rightVC:  RightViewController    = RightViewController()
        let cameraVC: CameraViewController   = CameraViewController()
        
        addContainerView(leftVC)
        addContainerView(rightVC)
        addContainerView(cameraVC)
        
        
        var centerViewFrame: CGRect = cameraVC.view.frame
        centerViewFrame.origin.x    = self.view.frame.width
        cameraVC.view.frame         = centerViewFrame
        
        var rightViewFrame: CGRect = rightVC.view.frame
        rightViewFrame.origin.x    = self.view.frame.width * 2
        rightVC.view.frame         = rightViewFrame
//        cameraVC.view.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(self.view.snp_right)
//            make.width.equalTo(self.view.snp_width)
//            make.top.equalTo(self.view.snp_top)
//            make.bottom.equalTo(self.view.snp_bottom)
//        }
//        rightVC.view.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(cameraVC.view.snp_right)
//            make.width.equalTo(self.view.snp_width)
//            make.top.equalTo(self.view.snp_top)
//            make.bottom.equalTo(self.view.snp_bottom)
//        }
        self.scrollView.contentSize                    = CGSizeMake(self.view.frame.width * 3, self.view.frame.height)
        self.scrollView.pagingEnabled                  = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator   = false
    }
    // MARK: - 添加方法
    private func addContainerView(childVC: UIViewController) {
        
            self.addChildViewController(childVC)
            self.scrollView.addSubview(childVC.view)
            childVC.didMoveToParentViewController(self)
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
