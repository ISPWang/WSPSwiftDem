//
//  PhotoEffectViewController.swift
//  swiftDemo
//
//  Created by auto on 16/3/3.
//  Copyright © 2016年 auto. All rights reserved.
//

import UIKit

class PhotoEffectViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    private var interests = InsertClass.createInterests()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    private struct Storyboard {
        static let CellIdentifier = "InterestCell"
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


extension PhotoEffectViewController: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(Storyboard.CellIdentifier, forIndexPath: indexPath) as! InsertCollectionViewCell
        
        cell.interest = self.interests[indexPath.item]
        
        return cell
        
    }
}

