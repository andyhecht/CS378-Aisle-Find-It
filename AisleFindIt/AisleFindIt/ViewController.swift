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
    @IBOutlet weak var loginAlertLabel: UILabel!
    
    var delegate: LoginProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.placeholder = "Enter User Name"
        password.placeholder = "Enter Password"
        loginAlertLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetch = NSFetchRequest(entityName: "User")
        
        do{
            let results = try managedContext.executeFetchRequest(fetch)
            users = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Failed to fetch \(error), \(error.userInfo)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let storeMapSegueIdentifier = "storeMapSegueIdentifier"
    let createUsernameSegueIdentifier = "CreateUsernameSegueIdentifier"
    let loginSegueIdentifier = "LoginSegueIdentifier"
    
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
    
    func loginAlert(message:String){
        dispatch_async(dispatch_get_main_queue()){
            [weak self] in
            let alert = UIAlertController(title: "Alert", message:"\(message)", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self!.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func onLoginClick(sender: AnyObject) {
        let userNameEntry = userName.text!
        let passwordEntry = password.text!
        var loginValid = false
        print("made loginValid variable")
        if(users.count < 1){
            loginAlert("Please create an account")
        }
        for i in users {
            print(i.valueForKey("userName")! as! String)
            print(userNameEntry)
            print("starts for loop")
            if(userNameEntry != "" && userNameEntry == (i.valueForKey("userName")! as! String)){
                print("checked userName")
                if(passwordEntry != "" && passwordEntry == (i.valueForKey("password")! as! String)){
                    print("checked password and made loginValid true")
                    loginValid = true
                    
                    break
                }else{
                    print("password wrong")
                        loginAlertLabel?.text = "Username/Password do not match our records"
//                        loginAlert("Username/Password do not match our records")
                }
            }else{
                print("userName wrong")
                    loginAlertLabel?.text = "Username/Password do not match our records"
            }
        }
        if(loginValid){
            self.performSegueWithIdentifier(loginSegueIdentifier, sender: self)
        }

    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if(identifier == createUsernameSegueIdentifier){
            return true
        }else{
            return false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if  segue.identifier == storeMapSegueIdentifier{
            segue.destinationViewController as? StoreMapViewController
            //let teamIndex = tableView.indexPathForSelectedRow?.row
        } else if(segue.identifier == createUsernameSegueIdentifier){
            let destination = segue.destinationViewController as! CreateNewUserViewController
            destination.delegate = self
            self.delegate = destination
        }
    }
    
    
}

