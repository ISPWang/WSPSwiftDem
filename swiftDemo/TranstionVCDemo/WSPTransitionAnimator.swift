//
//  WSPTransitionAnimator.swift
//  swiftDemo
//
//  Created by auto on 16/3/18.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class WSPTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    weak var tranContext: UIViewControllerContextTransitioning?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        self.tranContext = transitionContext
        
        let containerView = transitionContext.containerView()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! TransitionViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! TransitionViewController
        let button = fromVC.popBtn
        
        containerView?.addSubview(toVC.view)
        
        let circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        let extremePoint = CGPoint(x: button.center.x - 0, y: button.center.y - CGRectGetHeight(toVC.view.bounds))
        let radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        let circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toVC.view.layer.mask = maskLayer
        
        let maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        
        self.tranContext?.completeTransition(!self.tranContext!.transitionWasCancelled())
        self.tranContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
    
}
