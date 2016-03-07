//
//  PullToRefreshController.swift
//  swiftDemo
//
//  Created by auto on 16/3/7.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class PullToRefreshController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellIndentifier = "NewCellIdentifier" // 循环引用标示
    let favoriteEmoji = ["🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆"] // 喜欢的表情
    let newFavoriteEmoji = ["🏃🏃🏃🏃🏃", "💩💩💩💩💩", "👸👸👸👸👸", "🤗🤗🤗🤗🤗", "😅😅😅😅😅", "😆😆😆😆😆" ] // 新的喜欢表情
    
    var emojiData = [String]()
    
    var tableViewController = UITableViewController(style: .Plain)
    
    var refreshController = UIRefreshControl()
    var navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 64, width: UIScreen.mainScreen().bounds.size.width, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        emojiData = favoriteEmoji
        tableViewController.tableView.frame = CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64)
        let emojiTableView = tableViewController.tableView
        
        emojiTableView.backgroundColor = UIColor(red:0.092, green:0.096, blue:0.116, alpha:1)
        emojiTableView.dataSource = self
        emojiTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellIndentifier)
        
        tableViewController.refreshControl = self.refreshController
        self.refreshController.addTarget(self, action: "didRoadEmoji", forControlEvents: .ValueChanged)
        
        self.refreshController.backgroundColor = UIColor(red:0.113, green:0.113, blue:0.145, alpha:1)
        let attributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.refreshController.attributedTitle = NSAttributedString(string: "Last updated on \(NSDate())", attributes: attributes)
        self.refreshController.tintColor = UIColor.whiteColor()
        
        self.title = "emoji"
        self.navBar.barStyle = UIBarStyle.BlackTranslucent
        
        emojiTableView.rowHeight = UITableViewAutomaticDimension
        emojiTableView.estimatedRowHeight = 60.0
        emojiTableView.tableFooterView = UIView(frame: CGRectZero)
        emojiTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        
        self.view.addSubview(emojiTableView)
//        self.view.addSubview(navBar)
    }

    //UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIndentifier)! as UITableViewCell
        
        cell.textLabel!.text = self.emojiData[indexPath.row]
        cell.textLabel!.textAlignment = NSTextAlignment.Center
        cell.textLabel!.font = UIFont.systemFontOfSize(50)
        cell.backgroundColor = UIColor.clearColor()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    //RoadEmoji
    
    func didRoadEmoji() {
        
        self.emojiData += newFavoriteEmoji
        
        if self.emojiData.count > 20 {
            self.refreshController.endRefreshing()
            return
        }
        
        self.tableViewController.tableView.reloadData()
        self.refreshController.endRefreshing()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
