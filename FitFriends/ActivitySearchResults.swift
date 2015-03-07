//
//  ActivitySearchResults.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 2/28/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation
import UIKit

class ActivitySearchResults: UITableViewController, UISearchResultsUpdating {
    
    let viewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("ActivityController") as ActivityController
    var activityAPI: ActivityAPI = ActivityAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.searchArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchItem", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = ((viewController.searchArray[indexPath.row] as PFObject)["activityName"] as String)
        return cell
    }
    
    
    func updateSearchResultsForSearchController(searchController: UISearchController){
        viewController.searchArray.removeAll(keepCapacity: false)
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        activityAPI.searchActivity(searchController.searchBar.text){
            results, error in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if error != nil {
                println("Error searching : \(error)")
            }
            
            if(results != nil){
                self.viewController.searchArray = results as [PFObject]
                self.tableView.reloadData()
            }
        }
    }
    

}
