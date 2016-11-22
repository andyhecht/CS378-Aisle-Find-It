//
//  SettingsTableViewController.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController{
    // need to do something with this
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var locationControl: UISegmentedControl!
    
    @IBAction func saveAddress(sender: AnyObject) {
        
        if(locationControl.selectedSegmentIndex == 0){
            for i in users {
                if(i.valueForKey("userName") as! String == currentUser){
                    i.setValue(address.text!, forKey: "homeAddress")
                    notify("Home Address saved")
                }
            }
        }else if(locationControl.selectedSegmentIndex == 1){
            for i in users {
                if(i.valueForKey("userName") as! String == currentUser){
                    i.setValue("", forKey: "homeAddress")
                    notify("Make sure Location Services are enabled for AisleFindIt")
                }
            }
        }
        
    }
    
    func notify(message: String) {
        
        dispatch_async(dispatch_get_main_queue()){
            [weak self] in
            let alert = UIAlertController(title: "Alert", message:"\(message)", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self!.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Item", style: .Plain, target: self, action: #selector(addTapped))
        
        address.placeholder = "100 Drury Ln Austin TX 78705"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}