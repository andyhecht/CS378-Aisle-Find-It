//
//  StoreMapTableView.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class StoreMapTableView: UITableViewController{
    var array:Array<String> = ["HEB 7th Street Location", "HEB Burnet Road Location", "HEB Ed Bluestein Location"]
    var addresses:Array<String> = ["2701 E 7th St., Austin, TX, 78702", "5808 Burnet Rd., Austin, TX, 78756", "7112 Ed Bluestein, Austin, TX, 78723"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: #selector(logOut))
        //        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: nil)
        
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
        return array.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = array[row]
        cell.detailTextLabel!.text = addresses[row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        if(array[row] == "HEB 7th Street Location"){
            self.performSegueWithIdentifier("firstMapSegueIdentifier", sender: self)
        }else if(array[row] == "HEB Burnet Road Location"){
            self.performSegueWithIdentifier("secondMapSegueIdentifier", sender: self)
        }else if (array[row] == "HEB Ed Bluestein Location"){
            self.performSegueWithIdentifier("thirdMapSegueIdentifier", sender: self)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        shouldPerformSegueWithIdentifier("", sender: sender)
    }
    
    
    func logOut(){
        print("Logging out")
        navigationController?.popToRootViewControllerAnimated(true)
    }

}