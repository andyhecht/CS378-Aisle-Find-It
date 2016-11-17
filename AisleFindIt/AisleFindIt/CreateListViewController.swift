//
//  CreateListViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/20/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

var list = [""]
var mapNumber: Int = -1

class CreateListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addItemText: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            tableView.delegate = self
            tableView.dataSource = self
            
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
                list.removeAtIndex(indexPath.row)
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
        let itm = addItemText.text!
        if(itm != ""){
            if(!list.isEmpty && list[0] == ""){
                list.insert(addItemText.text!, atIndex: 0)
                list.popLast()
            }else{
                list.append((addItemText.text)!);
            }
        }else{
            print("here")
            let alertController = UIAlertController(title: "Please Enter Valid Item", message: "Text is empty.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion:nil)
        }

        addItemText.text = ""
        tableView.reloadData()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let itm = addItemText.text!
        if(itm != ""){
            if(list[0] == ""){
                list.insert(addItemText.text!, atIndex: 0)
                list.popLast()
            }else{
                list.append((addItemText.text)!);
            }
        }else{
            print("here")
            let alertController = UIAlertController(title: "Please Enter Valid Item", message: "Text is empty.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion:nil)
        }
        addItemText.text = ""
        tableView.reloadData()
        return true
    }
    
    // Called when the user touches on the main view (outside the UITextField).
    //
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
        
}
