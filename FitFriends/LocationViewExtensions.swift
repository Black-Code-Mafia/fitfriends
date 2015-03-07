//
//  LocationViewExtensions.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 3/2/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension LocationViewController: UISearchBarDelegate{
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.locationSearchTable.hidden = true
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.locationSearchTable.hidden = false
    }
}

extension LocationViewController:UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController){
        if searchController.searchBar.text != ""{
        if(self.localSearch != nil){
            self.localSearch.cancel()
        }
        
        var request:MKLocalSearchRequest = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchController.searchBar.text
        request.region = self.map.region
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        localSearch = MKLocalSearch(request: request)
        
        localSearch.startWithCompletionHandler({
            (response:MKLocalSearchResponse!, error:NSError!) in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            if (error != nil) {
                UIAlertView(title: "Map Error", message: error.localizedDescription, delegate: nil, cancelButtonTitle: "OK").show()
                return
            }
            
            if (response.mapItems.count == 0) {
                
                UIAlertView(title: "No Results", message: nil, delegate: nil, cancelButtonTitle: "OK").show()
                return
            }
            
            self.results = response.mapItems as [MKMapItem]
            self.locationSearchTable.reloadData()  
            
            
            
        })
            }

    }
}

extension LocationViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.locationSearchTable.hidden = true
        self.locationSearchController.active = false
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var selectedLocation = self.results[indexPath.row]
        self.map.addAnnotation(selectedLocation.placemark)
        self.map.selectAnnotation(selectedLocation.placemark, animated: true)
        self.map.setCenterCoordinate(selectedLocation.placemark.location.coordinate, animated: true)
    }
}

extension LocationViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.results.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = self.locationSearchTable.dequeueReusableCellWithIdentifier("LocationCell") as UITableViewCell
        var item = self.results[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.placemark.addressDictionary["Street"] as? String
        return cell
        
    }
    
}
