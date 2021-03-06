//
//  SettingsTableViewController.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import CoreData

class SettingsViewController: UIViewController, LoginProtocol {
    // need to do something with this
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var locationControl: UISegmentedControl!
    @IBOutlet weak var currentPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var reEnterNewPassword: UITextField!
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: #selector(logOut))
        
        currentPassword.placeholder = "Enter Current Password"
        newPassword.placeholder = "Enter New Password"
        reEnterNewPassword.placeholder = "Re-Enter New Password"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func logOut(){
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPasswordSaved(sender: AnyObject) {
        let currPass = currentPassword.text!
        let newPass = newPassword.text!
        let reEnter = reEnterNewPassword.text!
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        for i in users {
            if(i.valueForKey("userName") as! String == currentUser){
                
                if(currPass != i.valueForKey("password") as! String){
                    notify("Current Password is Incorrect. Please Try Again.")
                }else if(newPass == "" || reEnter == ""){
                    notify("Please enter a Password.")
                }else if(newPass != reEnter){
                    notify("New Passwords do not match.") // bring up alert that says "Passwords do not match!"
                }
                else{
                    for i in users {
                        if(i.valueForKey("userName") as! String == currentUser){
                            i.setValue(newPass, forKey: "password")
                            notify("New Password Saved!")
                            appDelegate.saveContext()
                            currentPassword.text = ""
                            newPassword.text = ""
                            reEnterNewPassword.text = ""
                        }
                    }
                }
            }
        }
    }
}