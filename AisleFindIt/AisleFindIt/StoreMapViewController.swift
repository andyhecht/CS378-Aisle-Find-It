//
//  StoreMapViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/17/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit
import MapKit

var itemNames: [Int:String] = [
    -1 : ""
]

class StoreMapViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var image_element: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["0"]
    var dictionary: [String:Int] = [
        "a/c filters" : 80,
        "air freshener" : 38,
        "aluminum foil" : 81,
        "appliances" : 77,
        "asian food" : 47,
        "auto supplies" : 37,
        "baby accessories" : 81,
        "baby food" : 81,
        "baby formula" : 81,
        "baby medication" : 53,
        "baby wipes" : 39,
        "bags" : 53,
        "bakeware" : 35,
        "band-aids" :  68,
        "barbecue sauce" : 61,
        "bath soap" : 80,
        "bath tissue" : 66,
        "batteries" : 90,
        "canned beans" : 62,
        "beans" : 61,
        "beer" : 59,
        "bird seed" : 65,
        "biscuit mix" : 62,
        "bleach" : 38,
        "boxed dinner" : 6,
        "bread" : 34,
        "broom" : 66,
        "mop" : 66,
        "cake mixes" : 76,
        "candles" : 37,
        "candy" : 74,
        "canned chili" : 75,
        "canned fish" : 75,
        "canned fruit" : 34,
        "canned meat" : 75,
        "canned tomatoes" : 48,
        "canned vegetables" : 76,
        "cat food" : 79,
        "cat litter" : 65,
        "blank cds" : 51, // blank CDs
        "blank dvds" : 51, // blank DVDs
        "cereal" : 49,
        "hot cereal" : 63,
        "charcoal" : 37,
        "chips" : 46,
        "cleaner" : 52,
        "cleanser" : 52,
        "closet items" : 66,
        "coffee" : 78,
        "coffee creamer" : 64,
        "coffee filters" : 64,
        "condiments" : 75,
        "cookies" : 60,
        "cotton balls" : 40,
        "cough & cold" : 82,
        "crackers" : 32,
        "dental care" : 40,
        "oral care" : 40,
        "deodorant" : 54,
        "diapers" : 39,
        "diet aids" : 82,
        "dish soap" : 38,
        "dog food" : 66,
        "dried fruit" : 48,
        "electrical" : 65,
        "eye care" : 54,
        "fabric softener" : 52,
        "facial care" : 82,
        "facial tissue" : 39,
        "feminine hygiene" : 53,
        "first aid" : 68,
        "floor wax" : 52,
        "flour" : 62,
        "foil bakeware" : 35,
        "food wrap" : 67,
        "food containers" : 67,
        "foot care" : 54,
        "fruit snacks" : 49,
        "gift card" : 90,
        "gift wrap" : 65,
        "glue" : 65,
        "gravy mixes" : 34,
        "greeting cards" : 79,
        "hair accessories" : 81,
        "hare care" : 53,
        "hair color" : 39,
        "hardware" : 51,
        "hispanic foods" : 33,
        "honey" : 33,
        "hot cocoa" : 63,
        "ice" : 103,
        "insecticides" : 37,
        "instant breakfast" : 63,
        "jam" : 33,
        "jello" : 63,
        "jelly" : 33,
        "juice" : 60,
        "ketchup" : 75,
        "kitchen gadgets" : 63,
        "kool-aid" : 35,
        "laundry detergent" : 52,
        "laxatives" : 54,
        "light bulbs" : 65,
        "lotion" : 82,
        "cream" : 82,
        "macaroni & cheese" : 34,
        "mac & cheese" : 34, // added this due to common names for the same product
        "marshmallows" : 49,
        "matches" : 37,
        "mayonnaise" : 75,
        "men's toiletries" : 68,
        "microwaveable food" : 62,
        "milk" : 25,
        "mixers" : 45,
        "mustard" : 75,
        "napkins" : 39,
        "nutritional aids" : 82,
        "nutritional bars" : 82,
        "baking nuts" : 48,
        "nuts" : 46,
        "oil" : 63,
        "shortening" : 63,
        "olives" : 61,
        "pancake mix" : 77,
        "paper towels" : 38,
        "party supplies" : 51,
        "pasta" : 76,
        "pastries" : 33,
        "peanut butter" : 33,
        "pet supplies" : 51,
        "picante sauce" : 33,
        "pickles" : 75,
        "plates" : 81,
        "cups" : 81,
        "pop tarts" : 63,
        "popcorn" : 46,
        "mashed potatoes" : 48,
        "stuffing" : 48,
        "powdered drink mix" : 35,
        "pudding" : 49,
        "pie filling" : 49,
        "q-tips" : 53,
        "religious candles" : 37,
        "rice" : 61,
        "rice cakes" : 61,
        "salad dressing" : 47,
        "salsa" : 33,
        "sauce/gravy mix" : 34,
        "school supplies" : 79,
        "office supplies" : 79,
        "seasonal items" : 90,
        "sewing items" : 40,
        "sewing needs" : 40,
        "shampoo" : 54,
        "conditioner" : 54,
        "shaving needs" : 82,
        "shoe care" : 54,
        "skin care" : 82,
        "snacks" : 46,
        "soup" : 76,
        "spices" : 34,
        "sports drinks" : 74,
        "starch" : 66,
        "sugar" : 48,
        "syrup" : 77,
        "tea" : 64,
        "toaster pastries" : 63,
        "tortillas" : 61,
        "toys" : 90,
        "trash bags" : 53,
        "travel size" : 54,
        "vinegar" : 61,
        "vitamins" : 68,
        "water" : 36,
        "wine" : 31
    ]
    
    
    var pins = [-1]
    
    enum ErrorHandling:ErrorType
    {
        case NetworkError
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style:.Plain, target:self, action: nil)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: #selector(StoreMapViewController.logOut)), UIBarButtonItem(title:"View Current Grocery List     ", style:.Plain, target:self, action: #selector(StoreMapViewController.viewList))]
        
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        
        items.removeAll()
        
        for i in 1 ..< 122 {
            if(i<14){
                items.append("\(i)")
            }else{
                items.append("")
            }
        }
        
        itemNames.removeAll()
        pins.removeAll()
        
        for i in list {
            let item = i.lowercaseString // no matter what casing the user puts, item will be found
            if let location = dictionary[item]{
                pins.append(location)
                itemNames[location] = item
            }else{
                print("\(item) not found")
            }
        }
        
        self.collectionView.reloadData()
        
        load_image("https://github.com/jyazdani/store-maps/blob/master/guide-austin-465-1.png?raw=true")
  
    }
    
    //coming back from viewing list
    override func viewDidAppear(animated: Bool) {
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        items.removeAll()
        
        for i in 1 ..< 122 {
            if(i<14){
                items.append("\(i)")
            }else{
                items.append("")
            }
        }
        
        itemNames.removeAll()
        pins.removeAll()
        
        for i in list {
            let item = i.lowercaseString // no matter what casing the user puts, item will be found
            if let location = dictionary[item]{
                pins.append(location)
                itemNames[location] = item
            }else{
                print("\(item) not found")
            }
        }
        dispatch_async(dispatch_get_main_queue()){
            self.collectionView.reloadData()
        }
    }
    
    func load_image(urlString:String)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    let img = UIImage(data: data!)
                    let size = CGSize(width: img!.size.width/4, height: img!.size.height/4)
                    let rect = CGRectMake(0, 0, size.width, size.height)
                    
                    UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
                    img!.drawInRect(rect)
                    let newImage = UIGraphicsGetImageFromCurrentImageContext()
                    self.image_element.image = newImage
                    UIGraphicsEndImageContext()
                    //                    self.image_element.image = UIImage(data: data!)
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        task.resume()
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
    
        if(pins.contains(indexPath.item)){
            cell.myLabel.text = ""
            cell.image.image = UIImage(named: "pin")
        
            
        }else{
            cell.myLabel.text = ""
            cell.myLabel.text = self.items[indexPath.item]
            cell.image.image = nil
        }
        //        cell.backgroundColor = UIColor.clearColor() // make cell more visible in our example project
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if(itemNames[indexPath.item] != nil){
            let item = itemNames[indexPath.item]!
            let alertController = UIAlertController(title: "Item Selected", message: "\(item)", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("You've pressed OK button");
            }
            let OKAction2 = UIAlertAction(title: "Delete", style: .Default) { (action:UIAlertAction) in
                print("You've pressed Delete button");
                list = list.filter() {$0 != item}
                
                let location = self.dictionary[item]
                self.pins = self.pins.filter() {$0 != location}
                
                itemNames.removeValueForKey(location!)

                dispatch_async(dispatch_get_main_queue()){
                    self.collectionView.reloadData()
                }
            }
            alertController.addAction(OKAction)
            alertController.addAction(OKAction2)
            
            self.presentViewController(alertController, animated: true, completion:nil)
        }
        print("Item Selected: \(itemNames[indexPath.item])")
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, atIndexPath indexPath: NSIndexPath) {
        
    }
    
    func viewList(){
        performSegueWithIdentifier("viewList2SegueIdentifier", sender: "one")
        mapNumber = 1
    }
    
    func logOut(){
        print("Logging out")
        navigationController?.popToRootViewControllerAnimated(true)
    }
}
