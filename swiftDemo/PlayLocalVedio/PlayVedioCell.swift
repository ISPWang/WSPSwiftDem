//
//  PlayVedioCell.swift
//  swiftDemo
//
//  Created by auto on 16/3/1.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

struct video {
    let image: String
    let title: String
    let source: String
}

class PlayVedioCell: UITableViewCell {
    @IBOutlet weak var vedioScreentSHot: UIImageView!

    @IBOutlet weak var vedioTitleLabel: UILabel!
    
    @IBOutlet weak var vedioSourceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
