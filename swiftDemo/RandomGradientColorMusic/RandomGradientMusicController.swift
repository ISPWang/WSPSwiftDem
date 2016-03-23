//
//  RandomGradientMusicController.swift
//  swiftDemo
//
//  Created by auto on 16/3/9.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit
import AVFoundation

class RandomGradientMusicController: UIViewController {

    var autdioPlayer = AVAudioPlayer() // 实例化播放器
    
    let gradientLayer = CAGradientLayer() // 创建页面视图
    
    var musicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func randomButtonClick(sender: AnyObject) {
        
        musicButton = sender as! UIButton; // 强转一下
        
        let bjMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Ecstasy", ofType: "mp3")!)
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            try autdioPlayer = AVAudioPlayer(contentsOfURL: bjMusic)
            
            autdioPlayer.prepareToPlay()
            autdioPlayer.play()
            
        }
        catch let audioError as NSError {
            print(audioError)
        }
        
        /*let timer =*/ NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(RandomGradientMusicController.randomColor), userInfo: nil, repeats: true)
        
        let redValue = CGFloat(drand48()) // 取随机
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        //graditent color
        gradientLayer.frame = view.bounds
        let color1 = UIColor(white: 0.5, alpha: 0.2).CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.4).CGColor as CGColorRef
        let color3 = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3).CGColor as CGColorRef
        let color4 = UIColor(red: 0, green: 0, blue: 1, alpha: 0.3).CGColor as CGColorRef
        let color5 = UIColor(white: 0.4, alpha: 0.2).CGColor as CGColorRef
        
        // 添加layer
        gradientLayer.colors = [color1, color2, color3, color4, color5]
        gradientLayer.locations = [0.10, 0.30, 0.50, 0.70, 0.90]
        gradientLayer.startPoint = CGPointMake(0, 0)
        gradientLayer.endPoint = CGPointMake(1, 1)
        self.view.layer.addSublayer(gradientLayer)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomColor() {
        let redValue = CGFloat(drand48()) // 取随机
        let blueValue =  CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        
        
        //        let rotationTransform: CATransform3D = CATransform3DMakeRotation(CGFloat(M_PI_4), 0.5, 1, 0.5)
        
        let animation          = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.toValue      = NSNumber(float: Float(M_PI * 2));//NSValue(CATransform3D: rotationTransform)
        animation.duration     = 0.2;
        animation.autoreverses = true;
        animation.cumulative   = true;
        animation.repeatCount  = 1;
        
        musicButton.layer.addAnimation(animation, forKey: nil)
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
