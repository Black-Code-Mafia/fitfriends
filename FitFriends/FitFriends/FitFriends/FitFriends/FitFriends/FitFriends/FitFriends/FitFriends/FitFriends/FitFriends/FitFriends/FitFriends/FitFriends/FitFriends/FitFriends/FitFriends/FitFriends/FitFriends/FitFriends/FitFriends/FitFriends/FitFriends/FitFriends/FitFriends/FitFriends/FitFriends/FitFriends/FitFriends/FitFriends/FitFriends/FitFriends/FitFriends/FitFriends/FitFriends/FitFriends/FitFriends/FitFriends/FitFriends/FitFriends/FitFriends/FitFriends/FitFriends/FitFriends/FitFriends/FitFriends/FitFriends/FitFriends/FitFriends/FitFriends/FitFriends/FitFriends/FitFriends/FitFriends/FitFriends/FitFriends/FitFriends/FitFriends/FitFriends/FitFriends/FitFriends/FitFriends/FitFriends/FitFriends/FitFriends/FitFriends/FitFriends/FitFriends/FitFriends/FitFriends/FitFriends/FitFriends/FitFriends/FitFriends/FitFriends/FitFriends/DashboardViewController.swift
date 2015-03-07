//
//  DashboardViewController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 11/16/14.
//  Copyright (c) 2014 Straight Arrow Studios. All rights reserved.
//

import Foundation
import Parse

class DashboardViewController : UIViewController{
    var currentUser:PFUser?
    
    func bringUpLoginModal(){
       performSegueWithIdentifier("userNotLoggedIn", sender: self)
    }
    
    @IBAction func logOutUser(sender: AnyObject) {
        if(currentUser != nil){
            PFUser.logOut()
            currentUser = PFUser.currentUser()
        }
        bringUpLoginModal()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        currentUser = PFUser.currentUser()
        if(currentUser == nil){
            bringUpLoginModal()
        }
    }
}
