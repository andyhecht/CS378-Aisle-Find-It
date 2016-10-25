//
//  CreateListViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/20/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

var list = [""]

class CreateListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItemText: UITextField!
        
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            
            list = [""]
            
            addItemText.placeholder = "Enter Item"
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: nil, action: nil)
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
        
        func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return list.count
        }
        
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("CreateListCell", forIndexPath: indexPath)
            cell.editing = true
            
            let row = indexPath.row
            if(list[row] != ""){
                cell.textLabel!.text = list[row]
            }else{
                cell.textLabel!.text = ""
            }
            //        cell.detailTextLabel?.text = "+"
            //        cell.detailTextLabel?.textColor = UIColor.greenColor()
            //        cell.detailTextLabel?.backgroundColor = UIColor.grayColor()
            
            return cell
        }
        
        
        
        // Override to support conditional editing of the table view.
        func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            // Return false if you do not want the specified item to be editable.
            return true
        }
        
        
        
        // Override to support editing the table view.
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            if editingStyle == .Delete {
                // Delete the row from the data source
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            } else if editingStyle == .Insert {
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
        
        
        
        func addTapped(){
            list.append("");
            self.tableView.reloadData()
        }
        
        func logOut(){
            print("Logging out")
            navigationController?.popToRootViewControllerAnimated(true)
        }
    
    
    @IBAction func onAddItemClicked(sender: AnyObject) {
        if(list[0] == ""){
            list.insert(addItemText.text!, atIndex: 0)
            list.popLast()
        }else{
            list.append((addItemText.text)!);
        }
        addItemText.text = ""
        tableView.reloadData()
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