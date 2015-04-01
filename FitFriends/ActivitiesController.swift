//
//  ActivitiesController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 3/8/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation
import UIKit



class ActivitiesController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
    @IBOutlet weak var navigationBarTap:UIGestureRecognizer!
    @IBOutlet weak var nav: UINavigationBar!
    @IBOutlet weak var searchTable: UITableView!
    var searchArray = [PFObject]()
    var activityAPI: ActivityAPI = ActivityAPI()
    var activitySearchController = UISearchController()

    
    @IBOutlet weak var navItem: UINavigationItem!
    override func viewDidLoad() {
       super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.allZeros
        self.searchTable.delegate = self
        self.searchTable.dataSource = self
        self.activitySearchController = ({
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.searchBar.delegate = self
        controller.hidesNavigationBarDuringPresentation = false
        controller.dimsBackgroundDuringPresentation = false
        controller.searchBar.searchBarStyle = .Minimal
        controller.searchBar.sizeToFit()
        controller.searchBar.showsCancelButton = true
        return controller
        })()
        
        
    }
    
    @IBAction func pushSearchBar(sender: AnyObject) {
        self.navItem.titleView = self.activitySearchController.searchBar
        self.activitySearchController.active = true
    }
}