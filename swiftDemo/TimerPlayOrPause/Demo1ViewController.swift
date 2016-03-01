//
//  Demo1ViewController.swift
//  swiftDemo
//
//  Created by auto on 16/2/26.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class Demo1ViewController: UIViewController {

    var count     = 0.0

    var timer     = NSTimer()

    var isPlaying = false
    
    
    @IBOutlet weak var timeLabel: UILabel! // 显示时间按钮
    
    @IBOutlet weak var resetButtonDidTouch: UIButton!
    
    @IBOutlet weak var playButtonTouch: UIButton!
    
    @IBOutlet weak var pauseButtonTouch: UIButton!
    
    
    @IBAction func resetButtonDidTouch(sender: AnyObject) {
        print("resent\(sender)")
        timer.invalidate()
        isPlaying = false
        count = 0
        timeLabel.text = String(count)
        
    }
    
    
    @IBAction func playButtonDidTouch(sender: AnyObject) {
        print("play\(sender)")
        if isPlaying {
            return
        }
        
        timer     = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTimer"), userInfo: nil, repeats: true)
        isPlaying = true;
        
    }
    @IBAction func pauseButtonDidTouch(sender: AnyObject) {
        print("pause\(sender)")
        timer.invalidate()
        isPlaying = false
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(count)
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func UpdateTimer() {
        count = 0.1 + count
        timeLabel.text = String(format: "%.1f", count)
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
