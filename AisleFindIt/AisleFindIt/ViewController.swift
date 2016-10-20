//
//  ViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/13/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import CoreData

var users = [NSManagedObject]()

class ViewController: UIViewController, AddNewUser {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var delegate: LoginProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        userName.placeholder = "Enter User Name"
        password.placeholder = "Enter Password"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let storeMapSegueIdentifier = "storeMapSegueIdentifier"
    let createUsernameSegueIdentifier = "CreateUsernameSegueIdentifier"
    let LoginSegueIdentifier = "LoginSegueIdentifier"

    func addNew(userName:String, password:String){
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let entity = NSEntityDescription.entityForName("User", inManagedObjectContext: managedContext)
        let user = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        user.setValue(userName, forKey: "userName")
        user.setValue(password, forKey: "password")
        
        do{
            try managedContext.save()
            users.append(user)
        } catch let error as NSError {
            print("Failed to save \(error), \(error.userInfo)")
        }
        
        delegate.notify("Account successfully created!")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == storeMapSegueIdentifier{
            let destination = segue.destinationViewController as? StoreMapViewController
            //let teamIndex = tableView.indexPathForSelectedRow?.row
        } else if  segue.identifier == LoginSegueIdentifier{
            segue.destinationViewController as? MainTableViewController
            //let teamIndex = tableView.indexPathForSelectedRow?.row
        } else if(segue.identifier == createUsernameSegueIdentifier){
            let destination = segue.destinationViewController as! CreateNewUserViewController
            destination.delegate = self
            self.delegate = destination
        }

        
    }
    

}

