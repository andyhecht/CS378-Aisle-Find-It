//
//  ChooseStoreViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/25/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

var storeAddress: String?

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class ChooseStoreViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var resultSearchController:UISearchController? = nil
    var selectedPin:MKPlacemark? = nil
    
    var initialLocation = CLLocation(latitude: 40.759011, longitude: -73.984472)

    let searchRadius: CLLocationDistance = 2000
    
    var searchController:UISearchController!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        //set up search bar
        let locationSearchTable = storyboard!.instantiateViewControllerWithIdentifier("LocationSearchTable") as! LocationSearchTable
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController?.searchResultsUpdater = locationSearchTable
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        locationSearchTable.mapView = mapView
        
        locationSearchTable.handleMapSearchDelegate = self
        //end search bar
        
        
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }else{
            
        }
//        let initialLocation = CLLocation(latitude: 30.2849, longitude: 97.7341)
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, searchRadius * 2.0, searchRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude:30.2849, longitude: -97.7431), animated: false) // sets center of starting map in Austin
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation
        // Reset the center of the map to the user's location whenever the user moves
        userLocation: MKUserLocation) {
        mapView.setCenterCoordinate(CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), animated: false)
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
    
//    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
//        if(identifier == "storeChosenSegueIdentifier"){
//            if(storeAddress == "2701 E 7th St, Austin TX" || storeAddress == "5808 Burnet Rd, Austin TX"){
//                return true
//            }else{
//                print("Store Address: \(storeAddress)")
//                return false
//            }
//        }else{
//            return false
//        }
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if  segue.identifier == "storeChosenSegueIdentifier"{
//            if(storeAddress == "2701 E 7th St, Austin TX"){
//                segue.destinationViewController as? StoreMapViewController
//            }else if(storeAddress == "5808 Burnet Rd, Austin TX"){
//                
//            }else if(storeAddress == "7112 Ed Bluestein, Austin TX"){
//                
//            }
//            //let teamIndex = tableView.indexPathForSelectedRow?.row
//        }
//    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //From <https://www.thorntech.com/2016/01/how-to-search-for-location-using-apples-mapkit/>
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        storeAddress = addressLine
        return addressLine
    }
}

extension ChooseStoreViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        
        let address = self.parseAddress(placemark)
        
        let long = placemark.location!.coordinate.longitude
        let lat = placemark.location!.coordinate.latitude
        
        let newAnnotation = MKPointAnnotation()
        newAnnotation.coordinate.latitude = lat
        newAnnotation.coordinate.longitude = long
        newAnnotation.title = placemark.name
        newAnnotation.subtitle = address
        mapView.addAnnotation(newAnnotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        mapView.setRegion(region, animated: true)
    }
    
    @IBAction func onGoToStore(sender: AnyObject) {
        if(storeAddress == "2701 E 7th St, Austin TX"){
            performSegueWithIdentifier("toStoreMap1Segue", sender: self)
        }else if(storeAddress == "5808 Burnet Rd, Austin TX"){
            performSegueWithIdentifier("toStoreMap2Segue", sender: self)
        }else if(storeAddress == "7112 Ed Bluestein Blvd, Austin TX"){
            performSegueWithIdentifier("toStoreMap3Segue", sender: self)
        }else{
            let alertController = UIAlertController(title: "Sorry for the Inconvenience", message: "The map for this store does not exist.", preferredStyle: .Alert)
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
            self.presentViewController(alertController, animated: true, completion:nil)

            print("Store Address: \(storeAddress)")
        }

    }
}

