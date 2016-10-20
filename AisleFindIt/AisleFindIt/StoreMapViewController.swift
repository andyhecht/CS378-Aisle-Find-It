//
//  StoreMapViewController.swift
//  AisleFindIt
//
//  Created by Andrew Hecht on 10/17/16.
//  Copyright © 2016 hecht. All rights reserved.
//

import UIKit

class StoreMapViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var image_element: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "Cell" // also enter this string as the cell identifier in the storyboard
    var items = ["0"]
    var defaultList = ["Eggs", "Milk", "Bananas", "Bread"]
    var dictionary: [String:Int] = [
        "A/C Filters" : 80,
        "Air Freshener" : 38,
        "Aluminum Foil" : 81,
        "Appliances" : 77,
        "Asian Foods" : 47,
        "Auto Supplies" : 37,
        "Baby Accessories" : 81,
        "Baby Food" : 81,
        "Baby Formula" : 81,
        "Baby Medication" : 53,
        "Baby Wipes" : 39,
        "Bags/Wrap" : 53,
        "Bakeware" : 35,
        "Band-Aids" :  68,
        "Barbecue Sauce" : 61,
        "Bath Soap" : 80,
        "Bath Tissue" : 66,
        "Batteries" : 90,
        "Beans (Canned)" : 62,
        "Beans (Dry)" : 61,
        "Beer" : 59,
        "Bird Seed" : 65,
        "Biscuit Mix" : 62,
        "Bleach" : 38,
        "Boxed Dinners Bread" : 34,
        "Brooms/Mops" : 66,
        "Cake Mixes" : 76,
        "Candles" : 37,
        "Candy" : 74,
        "Canned Chili" : 75,
        "Canned Fish" : 75,
        "Canned Fruit" : 34,
        "Canned Meat" : 75,
        "Canned Tomatoes" : 48,
        "Canned Vegetables" : 76,
        "Cat Food" : 79,
        "Cat Litter" : 65,
        "CD/DVD, Blank" : 51,
        "Cereal" : 49,
        "Cereal (Hot)" : 63,
        "Charcoal" : 37,
        "Chips" : 46,
        "Cleaners/Cleansers" : 52,
        "Closet Items" : 66,
        "Coffee" : 78,
        "Coffee Creamer" : 64,
        "Coffee Filters" : 64,
        "Condiments" : 75,
        "Cookies" : 60,
        "Cotton Balls" : 40,
        "Cough & Cold" : 82,
        "Crackers" : 32,
        "Dental /Oral Care" : 40,
        "Deodorant" : 54,
        "Diapers" : 39,
        "Diet Aids" : 82,
        "Dish Soap" : 38,
        "Dog Food" : 66,
        "Dried Fruit" : 48,
        "Electrical" : 65,
        "Eye Care" : 54,
        "Fabric Softener" : 52,
        "Facial Care" : 82,
        "Facial Tissue" : 39,
        "Feminine Hygiene" : 53,
        "First Aid" : 68,
        "Floor Wax" : 52,
        "Flour" : 62,
        "Foil Bakeware" : 35,
        "Food Wrap/Containers" : 67,
        "Foot Care" : 54,
        "Fruit Snacks" : 49,
        "Gift Card" : 90,
        "Gift Wrap" : 65,
        "Glue" : 65,
        "Gravy Mixes" : 34,
        "Greeting Cards" : 79,
        "Hair Accessories" : 81,
        "Hare Care" : 53,
        "Hair Color" : 39,
        "Hardware" : 51,
        "Hispanic Foods" : 33,
        "Honey" : 33,
        "Hot Cocoa" : 63,
        "Ice" : 103,
        "Insecticides" : 37,
        "Instant Breakfast" : 63,
        "Jam/Jelly" : 33,
        "Jell-O" : 63,
        "Juice" : 60,
        "Ketchup" : 75,
        "Kitchen Gadgets" : 63,
        "Kool-Aid" : 35,
        "Laundry Detergent" : 52,
        "Laxatives" : 54,
        "Light Bulbs" : 65,
        "Lotion/Cream" : 82,
        "Macaroni & Cheese" : 34,
        "Marshmallows" : 49,
        "Matches" : 37,
        "Mayonnaise" : 75,
        "Men's Toiletries" : 68,
        "Microwaveable Food" : 62,
        "Milk" : 25,
        "Mixers" : 45,
        "Mustard" : 75,
        "Napkins" : 39,
        "Nutritional Aids/Bars" : 82,
        "Nuts (Baking)" : 48,
        "Nuts (Snacking)" : 46,
        "Oil/Shortening" : 63,
        "Olives" : 61,
        "Pancake Mix" : 77,
        "Paper Towels" : 38,
        "Party Supplies" : 51,
        "Pasta" : 76,
        "Pastries" : 33,
        "Peanut Butter" : 33,
        "Pet Supplies" : 51,
        "Picante Sauce" : 33,
        "Pickles" : 75,
        "Plates/Cups" : 81,
        "Pop Tarts" : 63,
        "Popcorn" : 46,
        "Potatoes/Stuffing" : 48,
        "Powdered Drink Mix" : 35,
        "Pudding/Pie Filling" : 49,
        "Q-Tips" : 53,
        "Religious Candles" : 37,
        "Rice" : 61,
        "Rice Cakes" : 61,
        "Salad Dressing" : 47,
        "Salsa" : 33,
        "Sauce/Gravy Mix" : 34,
        "School/Office Supplies" : 79,
        "Seasonal Items" : 90,
        "Sewing Items" : 40,
        "Sewing Needs" : 40,
        "Shampoo/Conditioner" : 54,
        "Shaving Needs" : 82,
        "Shoe Care" : 54,
        "Skin Care" : 82,
        "Snacks" : 46,
        "Soup" : 76,
        "Spices" : 34,
        "Sports Drinks" : 74,
        "Starch" : 66,
        "Sugar" : 48,
        "Syrup" : 77,
        "Tea" : 64,
        "Toaster Pastries" : 63,
        "Tortillas" : 61,
        "Toys" : 90,
        "Trash Bags" : 53,
        "Travel Size" : 54,
        "Vinegar" : 61,
        "Vitamins" : 68,
        "Water" : 36,
        "Wine" : 31
    ]
    
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
        for i in 1 ..< 112 {
            items.append("\(i)")
        }
        load_image("https://github.com/jyazdani/store-maps/blob/master/guide-austin-465-1.png?raw=true")
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
        if((indexPath.item == 43) || (indexPath.item == 66) || (indexPath.item == 74)){
            cell.myLabel.text = ""
            cell.image.image = UIImage(named: "pin")
        }else if(indexPath == 24){
            // TODO: set eggs location to show pin: cell.image didn't work the way I had hoped. I couldn't figure out how to get it going
        }else{
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
