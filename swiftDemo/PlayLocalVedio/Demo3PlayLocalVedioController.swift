//
//  Demo3PlayLocalVedioController.swift
//  swiftDemo
//
//  Created by auto on 16/3/1.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class Demo3PlayLocalVedioController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var vedioTableView: UITableView!
    
    var data = [
        
        video(image: "videoScreenshot01", title: "Introduce 3DS Mario", source: "Youtube - 06:32"),
        video(image: "videoScreenshot02", title: "Emoji Among Us", source: "Vimeo - 3:34"),
        video(image: "videoScreenshot03", title: "Seals Documentary", source: "Vine - 00:06"),
        video(image: "videoScreenshot04", title: "Adventure Time", source: "Youtube - 02:39"),
        video(image: "videoScreenshot05", title: "Facebook HQ", source: "Facebook - 10:20"),
        video(image: "videoScreenshot06", title: "Lijiang Lugu Lake", source: "Allen - 20:30")
    ]
    
    var playViewController = AVPlayerViewController()
    
    var playView = AVPlayer()
    
    @IBAction func playLocalVideoButton(sender: AnyObject) {
        print(sender)
        
        let path = NSBundle.mainBundle().pathForResource("emoji zone", ofType: "mp4")
        
        playView = AVPlayer(URL: NSURL(fileURLWithPath: path!))
        
        playViewController.player = playView
        
        presentViewController(playViewController, animated: true) { () -> Void in
            self.playViewController.player?.play()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vedioTableView.delegate   = self
        self.vedioTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 220
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! PlayVedioCell
        let video = data[indexPath.row]
        cell.vedioScreentSHot.image = UIImage(named: video.image)
        cell.vedioTitleLabel.text   = video.title
        cell.vedioSourceLabel.text  = video.source
        
        
        return cell
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
