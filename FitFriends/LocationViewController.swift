//
//  LocationViewController.swift
//  FitFriends
//
//  Created by Adjei-Baah, Dennis on 2/23/15.
//  Copyright (c) 2015 Straight Arrow Studios. All rights reserved.
//

import Foundation
import MapKit

class LocationViewController:UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var locationSearchTable: UITableView!
    @IBOutlet weak var searchBarArea: UIView!
    @IBOutlet weak var map: MKMapView!
    //@IBOutlet weak var searchBar:UISearchBar!
    var locationManager:CLLocationManager!
    var localSearch:MKLocalSearch!
    var results = [MKMapItem]()
    var locationSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationSearchTable.delegate = self
        self.locationSearchTable.dataSource = self
        self.locationSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .Minimal
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            
    
            self.searchBarArea.addSubview(controller.searchBar)
            
            return controller
        })()
       
        self.locationSearchTable.hidden = true
        self.map.delegate = self
        self.locationManager = CLLocationManager()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
           }
    
   
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!){
        var region:MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 9000, 9000);
        self.map.setRegion(self.map.regionThatFits(region),animated:true)    }
    
    func locationManager (manager:CLLocationManager!, didUpdateLocations locations:[AnyObject]!) {
        let firstlocation = locations.first as? CLLocation
        if ((firstlocation) != nil) {
            var point = MKPointAnnotation()
            self.map.setCenterCoordinate((firstlocation?.coordinate)!, animated: true)
        }
        
    }
}
