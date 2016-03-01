//
//  ECGMineViewController.swift
//  swiftDemo
//
//  Created by auto on 16/2/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit
//import SnapKit


class ECGMineViewController: ECGBaseSettingViewController {
    var headerImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeader()
        setupGroup0()
        setupGroup1()
        // Do any additional setup after loading the view.
    }
    func setupHeader() {
        let headerView: UIView = UIView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, 120))
//        headerView.backgroundColor = UIColor.orangeColor()
        let headerImage: UIImageView = UIImageView()
        headerImage.clipsToBounds = true
        headerImage.layer.cornerRadius = 50
        headerView.addSubview(headerImage)
        self.headerImageView = headerImage
        headerImage.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(headerView.snp_center)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
//        let url: NSURL = N
       headerImage.sd_setImageWithURL(NSURL.init(string: "http://pic2.ooopic.com/01/03/51/25b1OOOPIC19.jpg"))
        self.settingTableView!.tableHeaderView = headerView
        
    }
    func setupGroup0() {
        let group: ECGSettingGroup = self.addGroup()
        group.header               = "头部"
        group.footer               = "尾部"
        let myOrder                = ECGSettingItem.itemWithTitle("我的订单")
        let myPraise               = ECGSettingItem.itemWithTitle("我的评价")
        let messageBox             = ECGSettingItem.itemWithTitle("消息盒子")
        group.items                = [myOrder, myPraise, messageBox]
    }
    func setupGroup1() {
        let group: ECGSettingGroup = self.addGroup()
        group.header               = "加入我们"
        group.footer               = "footer"
        let myProblem              = ECGSettingItem.itemWithTitle("意见反馈")
        let myDisclaimer           = ECGSettingItem.itemWithTitle("免责声明")
        let aboutMe                = ECGSettingItem.itemWithTitle("关于我们")
        group.items                = [myProblem, myDisclaimer, aboutMe]
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
