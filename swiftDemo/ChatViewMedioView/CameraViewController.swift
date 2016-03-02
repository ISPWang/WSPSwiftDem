//
//  CameraViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/2.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraView: UIView?
    
    var tempImageView: UIImageView?
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarHidden = true
        // Do any additional setup after loading the view.
        
        cameraView       = UIView()
        cameraView!.frame = self.view.frame
        self.view.addSubview(cameraView!)
        
        tempImageView       = UIImageView()
        tempImageView!.frame = self.view.frame
        self.view.addSubview(tempImageView!)
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView!.bounds
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error : NSError?
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera) }
        catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput) != nil) {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                cameraView!.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
            
        }
    }
    
    
    func didPressTakePhoto(){
        
        if let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {
                (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider  = CGDataProviderCreateWithCFData(imageData)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.tempImageView!.image = image
                    self.tempImageView!.hidden = false
                    
                }
                
                
            })
        }
        
        
    }
    // MARK: - 创建相机方法
    var didTakePhoto = Bool()
    // MARK: - 点击屏幕会调用的方法
    func didPressPhotoAnother() {
        if didTakePhoto == true {
            tempImageView?.hidden = true
            didTakePhoto          = false
        } else {
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        didPressPhotoAnother()
        print("点击屏幕调用")
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
