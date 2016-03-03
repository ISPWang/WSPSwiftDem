//
//  InsertCollectionViewCell.swift
//  swiftDemo
//
//  Created by auto on 16/3/3.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class InsertCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var interest: InsertClass! { // 相当于 OC 里面 调用setter方法
        
        didSet {
            updateUI()
        }
    }
    
    /**
     更新UI界面
     */
    private func updateUI() { // 内部方法 更新UI界面
        
        collImageView.image = interest.featuredImage
        titleLabel.text     = interest.description
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds      = true
    }
}
