//
//  ViewController.swift
//  swiftDemo
//
//  Created by auto on 16/1/14.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = ["tableSectionHeader", "timerPlayOrPause", "CustomerChangeFont", "PlayLocalVideo", "ChatVideoMenuViewController", "ShareStyle", "PhottoEffect", "PullToRefreshController", "RandomGradientColorMusic", "ImageZoomView", "SpotifyVideoBackground", "TransViewController", "TableViewCellAnimationIdentifier"]
    
    var showTable: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "EXAMPLE"
        
        showTable = UITableView(frame: self.view.bounds)
        showTable?.delegate = self
        showTable?.dataSource = self
        
        self.view.addSubview(showTable!)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ID   = "indentifitLLL"
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: ID)
        
        cell.textLabel?.text = data[indexPath.row]//"hello swift Demo " + String(indexPath.row)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        setUpControllers(indexPath)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
          
    }
    // MARK: - 初始化跳转视图
    private func setUpControllers(indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            let controllrt = ECGMineViewController();
            self.navigationController!.pushViewController(controllrt, animated: true)
        } else if indexPath.row == 1 {
            performSegueWithIdentifier("Demo1ViewControllerIdentifier", sender: nil)
        } else if indexPath.row == 2 {
            performSegueWithIdentifier("ChangeFontViewControllerIdentifier", sender: nil)
        } else if indexPath.row == 3 {
            performSegueWithIdentifier("PlayLocalVedioIdentifier", sender: nil)
        } else if indexPath.row == 4 {
            performSegueWithIdentifier("ChatVideoMenuIdentifier", sender: nil)
        } else if indexPath.row == 5 {
            let styleDemo = ShareStyleDemoViewController()
            styleDemo.title = data[indexPath.row]
            self.navigationController?.pushViewController(styleDemo, animated: true)
        } else if indexPath.row == 6 {
            print("Log\(indexPath)")
            performSegueWithIdentifier("PhotoEffectIdentifier", sender: nil)
        } else if indexPath.row == 7 {
            let pullRefresh = PullToRefreshController()
            pullRefresh.title = data[indexPath.row]
            self.navigationController!.pushViewController(pullRefresh, animated: true)
        } else if indexPath.row == 8 {
            performSegueWithIdentifier("RandomGradientMusicIndentifier", sender: nil)
        } else if indexPath.row == 9 {
            let imageViewZoomVC = ImageZoomViewController()
            imageViewZoomVC.title = data[indexPath.row]
            self.navigationController!.pushViewController(imageViewZoomVC, animated: true)
        } else if indexPath.row == 10 {
            performSegueWithIdentifier("SpotifyVideoIdentifier", sender: nil)
        } else if indexPath.row == 11 {
            performSegueWithIdentifier("TransIdentifier", sender: nil)
        } else if indexPath.row == 12 {
            performSegueWithIdentifier("TableViewCellAnimationIdentifier", sender: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}

