//
//  ECGSettingItem.swift
//  swiftDemo
//
//  Created by auto on 16/2/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ECGSettingItem: NSObject {
    
    var icon: String?
    var title: String?
    var subtitle: String?
    class func itemWithIcon(icon: String?, title: String) -> ECGSettingItem  {
        let item   = ECGSettingItem()
        item.icon  = icon
        item.title = title
        return item
    }
    class func itemWithTitle(title: String) -> ECGSettingItem {
        return itemWithIcon(nil, title: title)
    }
}
