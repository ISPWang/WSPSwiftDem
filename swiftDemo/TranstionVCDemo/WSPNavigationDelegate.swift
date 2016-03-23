//
//  WSPNavigationDelegate.swift
//  swiftDemo
//
//  Created by auto on 16/3/18.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class WSPNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    @IBOutlet weak var navigationController: UINavigationController!
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    func navigationController(navigationController: UINavigationController,
        interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
            return self.interactionController
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return WSPTransitionAnimator()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(WSPNavigationDelegate.panned(_:)))
        self.navigationController.view.addGestureRecognizer(panGesture)
    }
    
    func panned(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .Began:
            
            self.interactionController = UIPercentDrivenInteractiveTransition()
            if self.navigationController?.viewControllers.count > 1 {
                self.navigationController?.popViewControllerAnimated(true)
            } else {
                self.navigationController?.topViewController!.performSegueWithIdentifier("PushSegue", sender: nil)
            }
        case .Changed:
            
            let translation = gestureRecognizer.translationInView(self.navigationController!.view)
            let completionProgress = translation.x / CGRectGetWidth(self.navigationController!.view.bounds)
            self.interactionController?.updateInteractiveTransition(completionProgress)
        case .Ended:
            
            if (gestureRecognizer.velocityInView(self.navigationController!.view).x > 0) {
                self.interactionController?.finishInteractiveTransition()
            } else {
                self.interactionController?.cancelInteractiveTransition()
            }
            self.interactionController = nil
            
        default:
            self.interactionController?.cancelInteractiveTransition()
            self.interactionController = nil
        }
    }
}
