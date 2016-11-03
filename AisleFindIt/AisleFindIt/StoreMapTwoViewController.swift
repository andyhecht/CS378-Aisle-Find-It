//
//  StoreMapTwoViewController.swift
//  AisleFindIt
//
//  Created by Jamsheed Yazdani on 11/3/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class StoreMapTwoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var image_element: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["0"]
    var defaultList = ["Milk", "Batteries", "Bread"]
    var dictionary: [String:Int] = [
        "a/c filters" : 44,
        "air freshener" : 44,
        "appliances" : 78,
        "asian food" : 37,
        "auto supplies" : 43,
        "baby accessories" : 87,
        "baby food" : 87,
        "baby formula" : 87,
        "baby medication" : 73,
        "baby wipes" : 59,
        "bakeware" : 78,
        "band-aids" :  72,
        "barbecue sauce" : 38,
        "bath soap" : 45,
        "bath tissue" : 70,
        "batteries" : 104,
        "canned beans" : 93,
        "beans" : 66,
        "beer" : 62,
        "bird seed" : 60,
        "biscuit mix" : 93,
        "bleach" : 30,
        "boxed dinner" : 94,
        "bread" : 80,
        "broom" : 43,
        "mop" : 43,
        "cake mix" : 93,
        "candles" : 43,
        "candy" : 75,
        "canned chili" : 79,
        "canned fish" : 93,
        "canned fruit" : 37,
        "canned meat" : 93,
        "canned tomatoes" : 65,
        "canned vegetables" : 79,
        "cat food" : 47,
        "cat litter" : 47,
        "blank cds" : 88, // blank CDs
        "blank dvds" : 88, // blank DVDs
        "cereal" : 90,
        "hot cereal" : 62,
        "charcoal" : 46,
        "chips" : 92,
        "cleaner" : 44,
        "cleanser" : 44,
        "closet items" : 29,
        "coffee" : 90,
        "coffee creamer" : 76,
        "coffee filters" : 76,
        "condiments" : 38,
        "cookies" : 92,
        "cosmetics" : 87,
        "cotton balls" : 45,
        "cough & cold" : 85,
        "crackers" : 64,
        "dental care" : 71,
        "oral care" : 71,
        "deodorant" : 58,
        "diapers" : 45,
        "diet aids" : 85,
        "dish soap" : 43,
        "dog food" : 75,
        "dried fruit" : 51,
        "electrical" : 44,
        "eye care" : 71,
        "fabric softener" : 30,
        "facial care" : 45,
        "facial tissue" : 84,
        "feminine hygiene" : 57,
        "first aid" : 72,
        "floor wax" : 43,
        "flour" : 92,
        "foil bakeware" : 79,
        "foot care" : 71,
        "fruit snacks" : 62,
        "gift card" : 104,
        "gift wrap" : 32,
        "glue" : 43,
        "gluten free" : 51,
        "gravy mixes" : 65,
        "greeting cards" : 60,
        "hair accessories" : 44,
        "hare care" : 72,
        "hair color" : 30,
        "hardware" : 43,
        "hispanic foods" : 38,
        "honey" : 38,
        "hosiery" : 57,
        "hot cocoa" : 48,
        "ice" : 120,
        "insecticides" : 43,
        "instant breakfast" : 34,
        "jam" : 80,
        "jello" : 79,
        "jelly" : 80,
        "juice" : 89,
        "ketchup" : 38,
        "kitchen gadgets" : 92,
        "kool-aid" : 33,
        "laundry detergent" : 29,
        "laxatives" : 86,
        "light bulbs" : 44,
        "lotion" : 59,
        "cream" : 59,
        "macaroni & cheese" : 79,
        "mac & cheese" : 79, // added this due to common names for the same product
        "marshmallows" : 79,
        "matches" : 60,
        "mayonnaise" : 38,
        "men's toiletries" : 57,
        "microwaveable food" : 79,
        "milk" : 18,
        "canned milk" : 51,
        "mixers" : 48,
        "mustard" : 38,
        "napkins" : 42,
        "nutritional aids" : 72,
        "nutritional bars" : 72,
        "baking nuts" : 65,
        "nuts" : 78,
        "oil" : 37,
        "shortening" : 37,
        "olives" : 52,
        "pancake mix" : 48,
        "paper towels" : 56,
        "party supplies" : 46,
        "pasta" : 51,
        "pastries" : 38,
        "peanut butter" : 94,
        "pet supplies" : 60,
        "picante sauce" : 38,
        "pickles" : 52,
        "pimentos" : 93,
        "plates" : 28,
        "cups" : 28,
        "pop tarts" : 48,
        "popcorn" : 64,
        "mashed potatoes" : 80,
        "stuffing" : 80,
        "powdered drink mix" : 47,
        "pudding" : 79,
        "pie filling" : 79,
        "q-tips" : 45,
        "religious candles" : 43,
        "rice" : 80,
        "rice cakes" : 37,
        "salad dressing" : 94,
        "salsa" : 38,
        "salt" : 36,
        "sauce/gravy mix" : 65,
        "school supplies" : 74,
        "office supplies" : 74,
        "seasonal items" : 88,
        "sewing items" : 57,
        "sewing needs" : 57,
        "shaving needs" : 57,
        "shoe care" : 71,
        "skin care" : 59,
        "snacks" : 78,
        "soup" : 93,
        "spices" : 37,
        "sports drinks" : 61,
        "starch" : 29,
        "sugar" : 51,
        "syrup" : 48,
        "tea" : 62,
        "toaster pastries" : 48,
        "toothpicks" : 28,
        "tortillas" : 66,
        "toys" : 45,
        "vinegar" : 80,
        "vitamins" : 86,
        "water" : 47,
        "wine" : 62
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
        for i in 1 ..< 126 {
            items.append("\(i)")
        }
        
        for i in list {
            let item = i.lowercaseString // no matter what casing the user puts, item will be found
            if let location = dictionary[item]{
                pins.append(location)
            }
        }
        
        load_image("https://github.com/jyazdani/store-maps/blob/master/heb-burnet-store-map.png?raw=true")
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
                    let size = CGSize(width: img!.size.width/1.3, height: img!.size.height/1.3)
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
