//
//  ViewController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 11/15/14.
//  Copyright (c) 2014 Straight Arrow Studios. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ViewController: PFLogInViewController, PFLogInViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if((PFUser.currentUser()) != nil){
            NSLog("User has logged in %@", PFUser.currentUser().email)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.logInView.dismissButton.removeTarget(nil, action: nil, forControlEvents:UIControlEvents.AllEvents)
        self.logInView.dismissButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        if(PFUser.currentUser().email != nil){
            self.dismissViewControllerAnimated(true, completion: nil)
            NSLog("didLogInUser Called")
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
         NSLog("didLogInUser Called")
        return true
    }
    
     func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
         NSLog("didLogInUser Called")
    }
    
     func logInViewControllerDidCancelLogIn(logInController: PFLogInViewController!) {
         NSLog("didLogInUser Called")
    }
    
}

