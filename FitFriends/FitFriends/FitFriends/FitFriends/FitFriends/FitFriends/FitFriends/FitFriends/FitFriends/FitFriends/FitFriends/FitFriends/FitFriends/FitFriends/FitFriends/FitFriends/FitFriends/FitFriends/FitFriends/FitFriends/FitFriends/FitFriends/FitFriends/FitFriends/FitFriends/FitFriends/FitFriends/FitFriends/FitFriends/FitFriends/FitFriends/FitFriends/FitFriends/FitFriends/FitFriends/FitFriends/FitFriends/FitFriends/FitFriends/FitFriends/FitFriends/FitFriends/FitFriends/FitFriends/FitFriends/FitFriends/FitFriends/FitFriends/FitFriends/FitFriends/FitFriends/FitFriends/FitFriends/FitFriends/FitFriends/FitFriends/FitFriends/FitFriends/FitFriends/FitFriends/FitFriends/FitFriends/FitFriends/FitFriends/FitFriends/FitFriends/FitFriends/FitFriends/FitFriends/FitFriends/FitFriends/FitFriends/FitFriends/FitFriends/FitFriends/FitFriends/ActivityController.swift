//
//  ActivityController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 2/3/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation

class ActivityController :UICollectionViewController, UITextFieldDelegate{

   
    
    var imageArray:NSArray? = NSArray()
    
    override func viewDidLoad(){
    super.viewDidLoad()
        var imageUrl = NSURL(string: "http://placehold.it/100x100")
        var imageData = NSData(contentsOfURL: imageUrl!)
        var image = UIImage(data: imageData!)
        imageArray = NSArray(array: [image!])
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = imageArray?.count
        return count!
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cellId = "Cell"
        var collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as UICollectionViewCell
        var imageViewToBeLoaded = collectionViewCell.viewWithTag(100) as UIImageView
        imageViewToBeLoaded.image = imageArray?.objectAtIndex(indexPath.row) as? UIImage
        return collectionViewCell
    }
}
