//
//  SettingsTableViewController.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    // need to do something with this
    var test = ["No Settings for Beta Release"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Item", style: .Plain, target: self, action: #selector(addTapped))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("settingsCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = test[row]
        
        return cell
    }
    
    //    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        let cell:ListTableViewCell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath) as! ListTableViewCell
    //
    //        let row = indexPath.row
    //        if(defaultList[row] != ""){
    //            cell.item.text = defaultList[row]
    //        }
    //        //        cell.detailTextLabel?.text = "+"
    //        //        cell.detailTextLabel?.textColor = UIColor.greenColor()
    //        //        cell.detailTextLabel?.backgroundColor = UIColor.grayColor()
    //
    //        return cell
    //    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

}