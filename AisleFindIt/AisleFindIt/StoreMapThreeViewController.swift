//
//  StoreMapThreeViewController.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class StoreMapThreeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var image_element: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["0"]
    var defaultList = ["Milk", "Batteries", "Bread"]
    var dictionary: [String:Int] = [
        "a/c filters" : 33,
        "air freshener" : 57,
        "aluminum foil" : 42,
        "appliances" : 28,
        "auto supplies" : 32,
        "baby accessories" : 44,
        "baby food" : 56,
        "baby formula" : 56,
        "baby medication" : 44,
        "baby wipes" : 32,
        "bags" : 30,
        "bakeware" : 41,
        "band-aids" :  46,
        "barbecue sauce" : 52,
        "bath soap" : 33,
        "bath tissue" : 58,
        "batteries" : 69,
        "canned beans" : 52,
        "beans" : 28,
        "beer" : 50,
        "bird seed" : 44,
        "biscuit mix" : 30,
        "bleach" : 57,
        "boxed dinner" : 52,
        "bread" : 51,
        "broom" : 45,
        "mop" : 45,
        "cake mixes" : 54,
        "candles" : 33,
        "candy" : 53,
        "canned chili" : 28,
        "canned fish" : 28,
        "canned fruit" : 29,
        "canned meat" : 28,
        "canned tomatoes" : 28,
        "canned vegetables" : 40,
        "cat food" : 56,
        "cat litter" : 44,
        "blank cds" : 32, // blank CDs
        "blank dvds" : 32, // blank DVDs
        "cereal" : 42,
        "hot cereal" : 42,
        "charcoal" : 30,
        "chips" : 50,
        "cleaner" : 33,
        "cleanser" : 33,
        "closet items" : 33,
        "coffee" : 53,
        "coffee creamer" : 53,
        "coffee filters" : 53,
        "condiments" : 52,
        "cookies" : 27,
        "cotton balls" : 70,
        "cough & cold" : 58,
        "crackers" : 51,
        "dental care" : 34,
        "oral care" : 34,
        "deodorant" : 33,
        "diapers" : 32,
        "diet aids" : 48,
        "dish soap" : 33,
        "dog food" : 44,
        "dried fruit" : 17,
        "electrical" : 33,
        "eye care" : 46,
        "fabric softener" : 45,
        "facial care" : 33,
        "facial tissue" : 34,
        "feminine hygiene" : 57,
        "first aid" : 46,
        "floor wax" : 57,
        "flour" : 30,
        "foil bakeware" : 41,
        "food wrap" : 42,
        "food containers" : 42,
        "foot care" : 46,
        "fruit snacks" : 54,
        "gift card" : 66,
        "gift wrap" : 45,
        "glue" : 45,
        "gravy mixes" : 40,
        "greeting cards" : 57,
        "hair accessories" : 57,
        "hare care" : 34,
        "hair color" : 58,
        "hardware" : 33,
        "hispanic foods" : 40,
        "honey" : 27,
        "hot cocoa" : 41,
        "ice" : 75,
        "insecticides" : 32,
        "instant breakfast" : 54,
        "jam" : 27,
        "jello" : 54,
        "jelly" : 27,
        "juice" : 41,
        "ketchup" : 52,
        "kitchen gadgets" : 28,
        "kool-aid" : 29,
        "laundry detergent" : 57,
        "laxatives" : 58,
        "light bulbs" : 33,
        "lotion" : 33,
        "cream" : 33,
        "macaroni & cheese" : 32,
        "mac & cheese" : 32, // added this due to common names for the same product
        "marshmallows" : 42,
        "matches" : 30,
        "mayonnaise" : 52,
        "men's toiletries" : 34,
        "microwaveable food" : 52,
        "milk" : 21,
        "mixers" : 26,
        "mustard" : 52,
        "napkins" : 46,
        "nutritional aids" : 58,
        "nutritional bars" : 58,
        "nuts" : 51,
        "oil" : 29,
        "shortening" : 29,
        "olives" : 51,
        "pancake mix" : 30,
        "paper towels" : 46,
        "party supplies" : 45,
        "pasta" : 52,
        "pastries" : 51,
        "peanut butter" : 27,
        "pet supplies" : 32,
        "picante sauce" : 52,
        "pickles" : 51,
        "plates" : 54,
        "cups" : 54,
        "pop tarts" : 54,
        "popcorn" : 39,
        "mashed potatoes" : 52,
        "stuffing" : 52,
        "powdered drink mix" : 29,
        "pudding" : 54,
        "pie filling" : 54,
        "q-tips" : 34,
        "religious candles" : 33,
        "rice" : 28,
        "rice cakes" : 29,
        "salad dressing" : 39,
        "salsa" : 40,
        "sauce/gravy mix" : 52,
        "school supplies" : 45,
        "office supplies" : 45,
        "seasonal items" : 63,
        "shampoo" : 34,
        "conditioner" : 34,
        "shaving needs" : 34,
        "shoe care" : 46,
        "skin care" : 33,
        "snacks" : 31,
        "soup" : 53,
        "spices" : 53,
        "sports drinks" : 29,
        "starch" : 45,
        "sugar" : 53,
        "syrup" : 30,
        "tea" : 41,
        "toaster pastries" : 54,
        "tortillas" : 39,
        "toys" : 54,
        "trash bags" : 30,
        "vinegar" : 51,
        "vitamins" : 58,
        "water" : 27,
        "wine" : 26
    ]
    
    var pins = [-1]
    
    enum ErrorHandling:ErrorType
    {
        case NetworkError
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"Back", style:.Plain, target:self, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Log Out", style:.Plain, target:self, action: nil)
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        for i in 1 ..< 96 {
            items.append("\(i)")
        }
        
        for i in list {
            let item = i.lowercaseString // no matter what casing the user puts, item will be found
            if let location = dictionary[item]{
                pins.append(location)
            }
        }
        
        load_image("https://github.com/jyazdani/store-maps/blob/master/heb-bluestein-store-map.png?raw=true")
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
                    let size = CGSize(width: img!.size.width/2, height: img!.size.height/2)
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
        //        var first:String = list[0]
        //        var num = dictionary[first]
        //        print("value is: \(num)")
        
        if(pins.contains(indexPath.item)){
            cell.myLabel.text = ""
            cell.image.image = UIImage(named: "pin")
        }else{
            cell.myLabel.text = ""
            cell.myLabel.text = self.items[indexPath.item]
        }
        //        cell.backgroundColor = UIColor.clearColor() // make cell more visible in our example project
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, atIndexPath indexPath: NSIndexPath) {
        
    }
}
