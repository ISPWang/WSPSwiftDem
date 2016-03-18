//
//  WSPNavigationDelegate.swift
//  swiftDemo
//
//  Created by auto on 16/3/18.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class WSPNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return WSPTransitionAnimator()
    }
}
