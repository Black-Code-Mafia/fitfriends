//
//  ActivityAPI.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 2/3/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation


class ActivityAPI :NSObject {
    
    
    func searchActivity(searchTerm: String, onCompletion:(results:[AnyObject]?, error:NSError?) -> Void) {
        var query = PFQuery(className:"Activity")
        query.whereKey("activityName", hasPrefix:searchTerm)
        query.findObjectsInBackgroundWithBlock {
            (objects:[AnyObject]!, error:NSError!) in
            dispatch_async(dispatch_get_main_queue(), {
            onCompletion(results: objects, error: error)
            })
            
        }
        
    }
}

