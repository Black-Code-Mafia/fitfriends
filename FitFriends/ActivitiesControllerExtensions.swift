//
//  ActivityControllerExtensions.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 3/1/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation
import UIKit

extension ActivitiesController:UISearchBarDelegate{
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.navItem.titleView = {
            var text = UILabel()
            text.text = "What's Around Me"
        return text
        }()
    }
}

extension ActivitiesController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.searchArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = self.searchTable.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel?.text = (self.searchArray[indexPath.row] as PFObject)["activityName"] as? String
        return cell
        
    }
    
}

extension ActivitiesController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("showMapView", sender: self)
        activitySearchController.dismissViewControllerAnimated(true, completion: nil)
    }
}

extension ActivitiesController: UISearchResultsUpdating
{
    func updateSearchResultsForSearchController(searchController: UISearchController){
        if searchController.searchBar.text != "" {
            NSLog(searchController.searchBar.text)
            self.searchArray.removeAll(keepCapacity: false)
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            activityAPI.searchActivity(searchController.searchBar.text){
                results, error in
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                if error != nil {
                    println("Error searching : \(error)")
                }
                
                if(results != nil){
                    self.searchArray = results as [PFObject]
                    self.searchTable.reloadData()
                }
            }
        }
    }
}
