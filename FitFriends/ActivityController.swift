//
//  ActivityController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 2/3/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation

class ActivityController :UICollectionViewController{

    private let reuseIdentifier = "Cell"
    
    @IBOutlet weak var searchTable: UITableView!
    var imageArray:NSArray? = NSArray()
    var searchArray = [PFObject]()
    var activityAPI: ActivityAPI = ActivityAPI()
    var activitySearchController = UISearchController()
    var popularAndRecentsArray = [PFObject]()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge.allZeros
        self.searchTable.delegate = self
        self.searchTable.dataSource = self
        self.activitySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            self.navigationItem.titleView = controller.searchBar
            return controller
        })()
        self.searchTable.hidden = true
    }
    
}
