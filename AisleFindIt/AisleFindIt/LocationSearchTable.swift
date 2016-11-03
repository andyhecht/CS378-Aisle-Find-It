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
    
    
    
}

extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
    }
}