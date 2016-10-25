//
//  ChooseStoreViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/25/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import MapKit

class ChooseStoreViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    var searchController:UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // By default, for privacy the Map View does not show the user's current location.
        // Setting the showsUserLocation property displays the blue ball on the map.
        mapView.showsUserLocation = true
        
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation
        
        // Reset the center of the map to the user's location whenever the user moves
        userLocation: MKUserLocation!) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    @IBAction func zoomIn(sender: AnyObject) {
        
        // Currently only zooms to a span of 2km (2000m).  You can still zoom using
        // multi-touch gestures.
        
        let userLocation = mapView.userLocation
        
        let region = MKCoordinateRegionMakeWithDistance(
            userLocation.location!.coordinate, 2000, 2000)
        
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func changeMapType(sender: AnyObject) {
        
        // Rather than letting the user choose, we'll just toggle
        // between the standard view and the satellite view.
        if mapView.mapType == MKMapType.Standard {
            mapView.mapType = MKMapType.Satellite
        } else {
            mapView.mapType = MKMapType.Standard
        }
    }
//    
//    @IBAction func showSearchBar(sender: AnyObject) {
//        searchController = UISearchController(searchResultsController: nil)
//        searchController.hidesNavigationBarDuringPresentation = false
//        self.searchController.searchBar.delegate = self
//        present(searchController, animated: true, completion: nil)
//    }
    
    
    
    @IBOutlet weak var searchMap: UISearchBar!
}
