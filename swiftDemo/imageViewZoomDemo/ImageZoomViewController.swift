//
//  ImageZoomViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/11.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class ImageZoomViewController: UIViewController, UIScrollViewDelegate, touchImageViewDelegate {

    
    var imageView: touchImageView!
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        imageView = touchImageView(image: UIImage(named: "hello"))
        imageView.userInteractionEnabled = true
        
        imageView.delegate = self
        
        setupScrollView()
        
        scrollView.delegate = self
        zoomScrollViewScale(scrollView.bounds.size)
        
        scrollView.zoomScale = scrollView.minimumZoomScale
        
        recenterImage()
        
        self.view.multipleTouchEnabled = true
        
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillLayoutSubviews() {
         super.viewWillLayoutSubviews()
        zoomScrollViewScale(scrollView.bounds.size)
        
        if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
        
        recenterImage()
    }
    
    // MARK: - functions 
    private func setupScrollView() {
        scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        scrollView.contentSize = imageView.bounds.size
        scrollView.backgroundColor = UIColor.clearColor()
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    private func zoomScrollViewScale(zoomSize: CGSize) {
        let imageSize = imageView.bounds.size
        let scrollWidthScale = zoomSize.width / imageSize.width
        let scrollHeightScale = zoomSize.height / imageSize.height
        
        let miniMumScale = min(scrollWidthScale, scrollHeightScale)
        
        scrollView.minimumZoomScale = miniMumScale
        scrollView.maximumZoomScale = 3.0
    }
    private func recenterImage() {
        
        let scrollViewSize = scrollView.bounds.size
        let imageViewSize = imageView.frame.size
        let horizontalSpace = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2.0 : 0
        let verticalSpace = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.width) / 2.0 :0
        
        scrollView.contentInset = UIEdgeInsetsMake(verticalSpace, horizontalSpace, verticalSpace, horizontalSpace)
        
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        recenterImage()
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.nextResponder()?.touchesEnded(touches, withEvent: event)
        super.touchesEnded(touches, withEvent: event)
        
        let touch = (touches as NSSet).anyObject() as! UITouch
        let tapCount = touch.tapCount
        
        if tapCount == 2  {
            print(tapCount)
        }
        print(tapCount)
//        self.nextResponder()?.touchesEnded(touches, withEvent: event)
        
    }
    
     override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.nextResponder()?.touchesEnded(touches, withEvent: event)
        super.touchesBegan(touches, withEvent: event)
        print("开始")
    }
    
    
    func tapClick() {
        recenterImage()
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
