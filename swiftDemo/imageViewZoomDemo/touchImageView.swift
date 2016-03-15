//
//  touchImageView.swift
//  swiftDemo
//
//  Created by auto on 16/3/11.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

protocol touchImageViewDelegate {
    func tapClick()
}

class touchImageView: UIImageView {
    
    var delegate: touchImageViewDelegate?
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.nextResponder()?.touchesEnded(touches, withEvent: event)
        super.touchesEnded(touches, withEvent: event)
        
        let touch = (touches as NSSet).anyObject() as! UITouch
        let tapCount = touch.tapCount
        
        if tapCount == 2  {
            print(tapCount)
            self.delegate!.tapClick()
            
        }
//        print(tapCount)
        //        self.nextResponder()?.touchesEnded(touches, withEvent: event)
        
    }

}




