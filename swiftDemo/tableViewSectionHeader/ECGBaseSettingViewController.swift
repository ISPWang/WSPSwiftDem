//
//  ECGBaseSettingViewController.swift
//  swiftDemo
//
//  Created by auto on 16/2/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ECGBaseSettingViewController: ECGBaseViewController, UITableViewDelegate, UITableViewDataSource {
    weak var settingTableView: UITableView?
    var groups: NSMutableArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tableView = UITableView.init(frame: self.view.bounds, style: .Grouped)
        tableView.separatorStyle = .None
        tableView.sectionHeaderHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
        self.settingTableView = tableView
        tableView.rowHeight = 44
        self.view.addSubview(tableView)
        self.groups = NSMutableArray()
    }
    
    // MARK: - 添加一组数据
    func addGroup() -> ECGSettingGroup {
        let group = ECGSettingGroup()
        self.groups!.addObject(group)
        return group
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.groups!.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let group = self.groups![section] as! ECGSettingGroup
         return group.items!.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
         let group = self.groups![indexPath.section] as! ECGSettingGroup
        let cell : ECGMineSettingCell = ECGMineSettingCell.cellWithTableView(tableView)
        cell.item = group.items![indexPath.row] as! ECGSettingItem
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        // 1.取出模型
        let group = self.groups![indexPath.section] as! ECGSettingGroup
         let item = group.items![indexPath.row] as! ECGSettingItem
        
       let result = item.isKindOfClass(ECGSettingItem)
        print("结果\(result)")
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let group = self.groups![section] as! ECGSettingGroup
        return group.header
    }
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let groupOn = self.groups![section] as! ECGSettingGroup
        return groupOn.footer
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
