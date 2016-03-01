//
//  Demo2ChangeFontViewController.swift
//  swiftDemo
//
//  Created by auto on 16/2/29.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class Demo2ChangeFontViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉"]
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    var fontRowIndex = 0
    
    @IBOutlet weak var changeFontButton: UIButton!
    
    @IBOutlet weak var fontTableView: UITableView!
    
    @IBAction func changeFontClick(sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        fontTableView.delegate  = self
        fontTableView.dataSource = self
        
        changeFontButton.layer.cornerRadius = 55
        for family in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(family){
                print(font)
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        
//        cell.textLabel?.font  = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        cell.textLabel?.font  = UIFont(name:self.fontNames[fontRowIndex], size:16)
        
        return cell
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
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
