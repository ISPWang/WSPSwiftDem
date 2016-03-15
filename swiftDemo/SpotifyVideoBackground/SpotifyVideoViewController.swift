//
//  SpotifyVideoViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/15.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class SpotifyVideoViewController: VideoPlayerViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius  = 4
        signUpButton.layer.cornerRadius = 4
        setupVideoBackground()
        loginButton.bringSubviewToFront(view)
        signUpButton.bringSubviewToFront(view)
        
        loginButton.addTarget(self, action: Selector("loginBtn"), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        setupVideoBackground()
    }
    
    func loginBtn() {
        let VC = UIViewController()
        VC.view.backgroundColor = UIColor.redColor()
        self.navigationController?.pushViewController(VC, animated: true)
    }
    func setupVideoBackground() {
        
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .ResizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
//        view.userInteractionEnabled = false
        
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
