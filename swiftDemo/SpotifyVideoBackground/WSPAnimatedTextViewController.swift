//
//  WSPAnimatedTextViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/21.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class WSPAnimatedTextViewController: UIViewController {

    @IBAction func backClick(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passWordTextField: UITextField!
    
    @IBOutlet weak var userCenterConstaint: NSLayoutConstraint!
    
    @IBOutlet weak var passwordCenterConstaint: NSLayoutConstraint!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func loginClick(sender: AnyObject) {
        let bounds = self.loginBtn.bounds
        
        //Animate
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIViewAnimationOptions.CurveLinear, animations: {
            
            self.loginBtn.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginBtn.enabled = false
            
            }, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        // Do any additional setup after loading the view.
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        userCenterConstaint.constant     -= view.bounds.width
        passwordCenterConstaint.constant -= view.bounds.width
        loginBtn.alpha                   = 0.0
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // 动画样式
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
            
            self.userCenterConstaint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.1, options: .CurveEaseOut, animations: { () -> Void in
            
            self.passwordCenterConstaint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveEaseOut, animations: { () -> Void in
            
            self.loginBtn.alpha = 1.0
            
            }, completion: nil)
        
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
