//
//  ViewList2TableViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 11/15/16.
//  Copyright © 2016 hecht. All rights reserved.
//



import UIKit

class ViewList2TableViewController: UITableViewController {
    
    var defaultList = ["Eggs", "Milk", "Bananas", "Bread"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style:.Plain, target:self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: #selector(logOut))
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("TextCell", forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = list[row]
        
        let detailText = self.findKeyForValue(list[row], dictionary: itemNames)
        
        if(detailText != nil){
            var column = -1
            if(mapNumber != 3){
                column = detailText!%14
            }else{
                "MAP NUMBER IS 3!!"
                column = detailText!%12
            }
            cell.detailTextLabel?.text = "Column: \(column + 1)"
        }else{
            cell.detailTextLabel?.text = "Item not found in store"
        }
        return cell
    }
    
    func findKeyForValue(value: String, dictionary: [Int: String]) ->Int?
    {
        for (key, val) in dictionary
        {
            if (val.lowercaseString == value.lowercaseString)
            {
                return key
            }
        }
        
        return nil
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
            list.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func logOut(){
        print("Logging out")
        navigationController?.popToRootViewControllerAnimated(true)
    }
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

