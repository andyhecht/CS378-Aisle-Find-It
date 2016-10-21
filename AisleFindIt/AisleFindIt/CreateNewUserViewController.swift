//
//  CreateNewUserViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/13/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class CreateNewUserViewController: UIViewController, LoginProtocol {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reEnterPassword: UITextField!
    
    // this is to check if username contains only letters, numbers, or acceptable symbols
    let checkUserName = NSCharacterSet.init(charactersInString: "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890-_.")
    
    var delegate: AddNewUser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.placeholder = "Enter User Name"
        password.placeholder = "Enter Password"
        reEnterPassword.placeholder = "Re-Enter Password"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func notify(message: String) {
        
        dispatch_async(dispatch_get_main_queue()){
            [weak self] in
            let alert = UIAlertController(title: "Alert", message:"\(message)", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self!.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return false
    }
    
    @IBAction func onLoginClicked(sender: AnyObject) {
        let userNameEntry = NSCharacterSet.init(charactersInString: userName.text!)
        
        let userNameText = userName.text!
        let passwordText = password.text!
        
        var loginValid = false
        
        if(!checkUserName.isSupersetOfSet(userNameEntry)){
            notify("Invalid Characters used for Username. Please only use letters, numbers or any of the following characters: '-', '_', '.'.")
        }else if(userNameText == ""){
            notify("Please enter a Username")
        }else if(passwordText == ""){
            notify("Please enter a Password")
        }else if(passwordText != reEnterPassword.text!){
            notify("Passwords do not match.") // bring up alert that says "Passwords do not match!"
        }else{
            loginValid = true
            delegate.addNew(userNameText, password: passwordText)
        }
        
        if(loginValid){
            self.performSegueWithIdentifier("CreateNewLoginSegueIdentifier", sender: self)
        }
        
    }
}
