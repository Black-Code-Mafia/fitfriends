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

class LoginViewController: PFLogInViewController, PFLogInViewControllerDelegate {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpLoginUI()
        self.delegate = self
        if((PFUser.currentUser()) != nil){
            NSLog("User has logged in %@", PFUser.currentUser().email)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        self.logInView.dismissButton.removeTarget(nil, action: nil, forControlEvents:UIControlEvents.AllEvents)
        self.logInView.dismissButton.hidden = true
    }
    
    func setUpLoginUI(){
        var textFields = UITextField();
        
        
        textFields.backgroundColor = UIColor(white: 1.0, alpha: 0.36)
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "alt-background")!)
        self.logInView.logo = UIImageView(image: UIImage(named:"fitfriends"))
        self.logInView.usernameField.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        self.logInView.passwordField.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName:UIColor.whiteColor()])
        self.logInView.usernameField.backgroundColor =  UIColor(white: 1.0, alpha: 0.36)
        self.logInView.passwordField.backgroundColor =  UIColor(white: 1.0, alpha: 0.36)
        self.logInView.usernameField.layer.borderColor = UIColor(white: 1, alpha:0).CGColor
        self.logInView.usernameField.layer.cornerRadius = 3
        self.logInView.passwordField.layer.cornerRadius = 3
        self.logInView.usernameField.textColor = UIColor.whiteColor()
        self.logInView.passwordField.textColor = UIColor.whiteColor()
        self.logInView.passwordForgottenButton.setTitleColor(UIColor(red: 0.306, green: 0.808, blue: 0.753, alpha: 1), forState: UIControlState.Normal)
        self.logInView.passwordForgottenButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: UIControlState.Selected)
        self.logInView.passwordForgottenButton.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 17)
        
        
        
    }
    
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var screenRect = UIScreen.mainScreen().bounds
        var logo = self.logInView.logo
        self.logInView.logo.frame = CGRectMake(logo.frame.origin.x, logo.frame.origin.y/1.5, logo.bounds.width,logo.bounds.height)
        self.logInView.usernameField.frame = CGRectMake(logo.frame.origin.x,
                                                        0.3*screenRect.height,
                                                        logo.bounds.width,
                                                        logo.bounds.height)
        self.logInView.passwordField.frame = CGRectMake(logo.frame.origin.x,
            0.4*screenRect.height,
            logo.bounds.width,
            logo.bounds.height)
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

