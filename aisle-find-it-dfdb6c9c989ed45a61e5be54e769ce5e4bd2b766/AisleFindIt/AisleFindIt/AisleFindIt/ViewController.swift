//
//  ViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/13/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    

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


    @IBAction func onCreateNewUser(sender: AnyObject) {
    }

    @IBAction func onLoginClicked(sender: AnyObject) {
    }
}

