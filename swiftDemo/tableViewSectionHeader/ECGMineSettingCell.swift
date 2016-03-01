//
//  ECGMineSettingCell.swift
//  swiftDemo
//
//  Created by auto on 16/2/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ECGMineSettingCell: UITableViewCell {
    var indexPath: NSIndexPath?
    var item: ECGSettingItem! {
        willSet {
            self.item = newValue
        }
        
        didSet {
            self.textLabel!.text = item.title
        }
    }
    private var tableView: UITableView?
    private var tttLAbel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - 快速创建cell
    class func cellWithTableView(tableView: UITableView) -> ECGMineSettingCell {
        let ID = "setting"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? ECGMineSettingCell
        if (cell == nil) {
            cell = ECGMineSettingCell.init(style: .Default, reuseIdentifier: ID)
            
            cell!.tableView = tableView;
        
        }
        return cell!
    }
//    class func createdView() {
//        self.backgroundColor = UIColor.whiteColor()
//        let textLabel: UILabel = UILabel()
//        textLabel.font = UIFont.systemFontOfSize(15)
//        textLabel.textColor = UIColor.redColor()
//        self.contentView.addSubview(textLabel)
//        self.tttLAbel = textLabel
//    }
    
//    override func init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//    }
    

}
