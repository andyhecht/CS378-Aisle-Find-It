//
//  LocationSearchTable.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import MapKit

class LocationSearchTable: UITableViewController {
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var handleMapSearchDelegate:HandleMapSearch? = nil
    
}

extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        guard let mapView = mapView,
            let searchBarText = searchController.searchBar.text else { return }
//        
//        let allAnnotations = self.mapView!.annotations
//        self.mapView!.removeAnnotations(allAnnotations)
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.startWithCompletionHandler { response, _ in
            guard let response = response else {
                return
            }
//            for item in response.mapItems {
//                let placemark = item.placemark
//                let address = self.parseAddress(placemark)
//                
//                let long = placemark.location!.coordinate.longitude
//                let lat = placemark.location!.coordinate.latitude
//                
//                let newAnnotation = MKPointAnnotation()
//                newAnnotation.coordinate.latitude = lat
//                newAnnotation.coordinate.longitude = long
//                newAnnotation.title = item.name
//                newAnnotation.subtitle = address
//                self.mapView!.addAnnotation(newAnnotation)
//                // Display the received items
//            }
            self.matchingItems = response.mapItems
            self.tableView.reloadData()

        }
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
        return addressLine
    }
    
}

extension LocationSearchTable {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")!
        let selectedItem = matchingItems[indexPath.row].placemark
        cell.textLabel?.text = selectedItem.name
        
        let address = self.parseAddress(selectedItem)
        
        cell.detailTextLabel?.text = address
        return cell
    }
}

extension LocationSearchTable {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(selectedItem)
        dismissViewControllerAnimated(true, completion: nil)
    }
}